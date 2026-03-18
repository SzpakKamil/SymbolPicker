//
//  SPDataManager.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public actor SPDataManager {
    // MARK: - Error Cases
    public enum Error: Swift.Error {
        case fileNotFound(fileName: String)
        case bundleURLNotCreated(fileName: String)
        case decodingFailed(type: String, error: DecodingError)
        case unknownType(type: String)
        case otherError(error: any Swift.Error)
    }
    
    // MARK: - Cache Data
    
    struct Cache: Sendable {
        var taskForType: [String: Sendable] = [:]
        var localeByType: [String: String] = [:]
        var localesByType: [String: [String]] = [:]
        var dataByType: [String: [Sendable]] = [:]
    }

    private var cache = Cache()
    static let fallbackLocale = "en"
    
    // MARK: - Search Methods
    
    public func search<T: SPDataAsset>(_ type: T.Type, for text: String) async throws -> [SPCategory<T>] {
        let items = try await fetchRaw(type: T.self)
        
        if text.trimmingCharacters(in: .whitespaces).isEmpty {
            return self.groupItems(items)
        }
        
        let filteredItems = await performSearch(items, for: text)
        return [SPCategory(category: SPTranslation.SearchResults.localizedDescription, elements: filteredItems)]
    }
    
    private nonisolated func performSearch<T: SPDataAsset>(_ items: [T], for text: String) async -> [T] {
        return items.filter { $0.matches(text) }.removeDuplicates{ $0.isDuplicate(of: $1)}
    }
    
    // MARK: - Fetching and Loading
    
    public func fetch<T: SPDataAsset>(type: T.Type) async throws -> [SPCategory<T>] {
        let items = try await fetchRaw(type: type)
        return self.groupItems(items)
    }
    
    private func groupItems<T: SPDataAsset>(_ items: [T]) -> [SPCategory<T>] {
        var orderedCategories: [String] = []
        var groupedDictionary: [String: [T]] = [:]
        
        for item in items {
            guard let categoryName = item.category else { continue }
            
            if groupedDictionary[categoryName] == nil {
                orderedCategories.append(categoryName)
                groupedDictionary[categoryName] = [item]
            } else {
                groupedDictionary[categoryName]?.append(item)
            }
        }
        
        return orderedCategories.map { categoryName in
            SPCategory(category: categoryName, elements: groupedDictionary[categoryName] ?? [])
        }
    }
    
    private func fetchRaw<T: SPDataAsset>(type: T.Type) async throws -> [T] {
        let key = type.filePrefix
        
        if let cachedData = cache.dataByType[key] as? [T] { return cachedData }
        
        if let existingTask = cache.taskForType[key] as? Task<[T], Swift.Error> {
            return try await existingTask.value
        }
        
        let locale = self.resolveLocaleIdentifier(for: type)
        
        let task = Task<[T], Swift.Error> {
            return try await T.fetchAssets(locale: locale)
        }
        
        cache.taskForType[key] = task
        
        do {
            let value = try await task.value
            cache.dataByType[key] = value
            cache.taskForType.removeValue(forKey: key)
            return value
        } catch {
            cache.taskForType.removeValue(forKey: key)
            throw error
        }
    }
    
    // MARK: - Locale Resolution
    
    private func resolveLocaleIdentifier<T: SPDataAsset>(for type: T.Type) -> String {
        let prefix = type.filePrefix
        if let cached = cache.localeByType[prefix] { return cached }
        
        let (systemLang, systemRegion) = getSystemLocaleComponents()
        let fullIdentifier = "\(systemLang)_\(systemRegion)"
        let available = getLocales(for: type)
        
        let finalLocale: String
        if available.contains(fullIdentifier) {
            finalLocale = fullIdentifier
        } else if available.contains(systemLang) {
            // This handles the case where user is fr_CA but you only have fr
            finalLocale = systemLang
        } else if let fuzzyMatch = available.first(where: { $0.hasPrefix("\(systemLang)_") }) {
            // This handles the case where user is fr_CA, you don't have fr_CA or fr,
            // but you DO have fr_FR. Better than English.
            finalLocale = fuzzyMatch
        } else {
            finalLocale = Self.fallbackLocale
        }
        
        cache.localeByType[prefix] = finalLocale
        return finalLocale
    }

    func getLocales<T: SPDataAsset>(for type: T.Type) -> [String] {
        let prefix = type.filePrefix
        
        if let cached = cache.localesByType[prefix] { return cached }
        
        let result = fetchLocalesFromBundle(for: prefix)
        cache.localesByType[prefix] = result
        return result
    }

    nonisolated private func fetchLocalesFromBundle(for prefix: String) -> [String] {
        guard let resourceURL = Bundle.module.resourceURL,
              let files = try? FileManager.default.contentsOfDirectory(at: resourceURL, includingPropertiesForKeys: nil)
        else { return [Self.fallbackLocale] }

        let locales = files.compactMap { url -> String? in
            let name = url.lastPathComponent
            guard name.hasPrefix("\(prefix)_"), name.hasSuffix(".json") else { return nil }
            return name.replacingOccurrences(of: "\(prefix)_", with: "")
                       .replacingOccurrences(of: ".json", with: "")
        }
        
        let sorted = Array(Set(locales)).sorted()
        return sorted.isEmpty ? [Self.fallbackLocale] : sorted
    }

    nonisolated func getSystemLocaleComponents() -> (language: String, region: String) {
        let current = Locale.current
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, *) {
            return (current.language.languageCode?.identifier ?? Self.fallbackLocale,
                    current.language.region?.identifier ?? "")
        } else {
            return (current.languageCode ?? Self.fallbackLocale,
                    current.regionCode ?? "")
        }
    }
    
    deinit{
        cache = Cache()
    }
}
