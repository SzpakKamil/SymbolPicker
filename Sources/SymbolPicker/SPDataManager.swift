//
//  SPDataManager.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPDataManager{
    enum Error: Swift.Error{
        case fileNotFound(fileName: String)
        case bundleURLNotCreated(fileName: String)
        case decodingFailed(type: String, error: DecodingError)
        case unknownType(type: String)
        case otherError(error: any Swift.Error)
    }
}

actor SPDataManager{
    private var cache: [String: Sendable] = [:]
    
    private static let fallbackLocale = "en"
    
    func search<T: SPDataAsset>(_ type: T.Type, for text: String) async throws -> [T] {
        let items = try await fetch(type: T.self)
        if text.isEmpty{ return items }
        return await performSearch(items, for: text)
    }
    
    func fetch<T: SPDataAsset>(type: T.Type) async throws -> [T]{
        let key = type.filePrefix
        
        if let existingTask = cache[key] as? Task<[T], Swift.Error> {
            return try await existingTask.value
        }
        
        let task = Task<[T], Swift.Error> {
            let locale = try await self.resolveLocaleIdentifier(for: type)
            return try await self.loadData(type: type, locale: locale)
        }
        
        cache[key] = task
        
        do {
            return try await task.value
        } catch {
            cache.removeValue(forKey: key)
            throw error
        }
    }
    
    private func saveCache<S: Sendable>(key: String, value: S){
        cache[key] = value
    }
    
    private nonisolated func performSearch<T: SPDataAsset>(_ items: [T], for text: String) async -> [T] {
        return items.filter { $0.matches(text) }
    }
    
    
    nonisolated func loadData<T: SPDataAsset>(type: T.Type, locale: String) async throws -> [T]{
        do{
            let bundle = Bundle.module
            let names = ["\(type.filePrefix)_\(locale).json", "\(type.filePrefix)_\(Self.fallbackLocale).json"]
            
            for name in names {
                try Task.checkCancellation()
                guard let url = bundle.url(forResource: name, withExtension: nil) else { continue }
                let data = try Data(contentsOf: url)
                let decoded = try JSONDecoder().decode([T].self, from: data)
                return decoded.filter { $0.isAvailable() }
            }
            throw Error.fileNotFound(fileName: "\(type.filePrefix)_\(locale).json")
        }catch let error as DecodingError{
            throw SPDataManager.Error.decodingFailed(type: "\(T.self)", error: error)
        }catch {
            throw SPDataManager.Error.otherError(error: error)
        }
    }
    
    private func resolveLocaleIdentifier<T: SPDataAsset>(for type: T.Type) async throws -> String {
        if let resolvedLocale = cache[type.resolvedLocalePrefix] as? String { return resolvedLocale }
        let (currentLang, currentRegion) = getSystemLocaleComponents()
        let fullIdentifier = "\(currentLang)_\(currentRegion)"
        
        try Task.checkCancellation()
        let available = await getSupportedLocales(for: type)
        
        let finalLocale: String
        if available.contains(fullIdentifier) {
            finalLocale = fullIdentifier
        } else if available.contains(currentLang) {
            finalLocale = currentLang
        } else {
            finalLocale = Self.fallbackLocale
        }
        
        self.cache[type.resolvedLocalePrefix] = finalLocale
        return finalLocale
    }
    
    private func getSupportedLocales<T: SPDataAsset>(for type: T.Type) async -> [String] {
        if let supportedLocales = cache[type.localizationPrefix] as? [String] { return supportedLocales }
        let final = await getLocalesList(for: type)
        self.cache[type.localizationPrefix] = final
        return final
    }
    
    nonisolated private func getLocalesList<T: SPDataAsset>(for type: T.Type) async -> [String] {
        let bundle = Bundle.module
        guard let resourceURL = bundle.resourceURL,
              let files = try? FileManager.default.contentsOfDirectory(at: resourceURL, includingPropertiesForKeys: nil)
        else {
            let fallback = [Self.fallbackLocale]
            return fallback
        }
        
        let locales = files.compactMap { url -> String? in
            let name = url.lastPathComponent
            guard name.hasPrefix("\(type.filePrefix)_"), name.hasSuffix(".json") else { return nil }
            return name.replacingOccurrences(of: "\(type.filePrefix)_", with: "")
                .replacingOccurrences(of: ".json", with: "")
        }
        let result = Set(locales).sorted()
        return result.isEmpty ? [Self.fallbackLocale] : result
    }
    
    
    private func getSystemLocaleComponents() -> (language: String, region: String) {
        if #available(iOS 16, macOS 13, *) {
            let lang = Locale.current.language.languageCode?.identifier ?? Self.fallbackLocale
            let region = Locale.current.language.region?.identifier ?? ""
            return (lang, region)
        } else {
            let lang = Locale.current.languageCode ?? Self.fallbackLocale
            let region = Locale.current.regionCode ?? ""
            return (lang, region)
        }
    }
}
