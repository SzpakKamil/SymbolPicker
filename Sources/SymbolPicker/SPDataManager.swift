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
        case otherError(error: any Swift.Error)
    }
}

actor SPDataManager{
    private static let fallbackLocale = "en"
    
    func fetchSymbols() async throws(SPDataManager.Error) -> [SPSymbol] {
        let supportedLocale = resolveLocaleIdentifier()
        let data = try getSymbolsData(for: supportedLocale)
        let decoder = JSONDecoder()
        do{
            let decodedSymbols = try decoder.decode([SPSymbol].self, from: data)
            let filteredSymbols = decodedSymbols.filter{ $0.isAvailable() }
            return filteredSymbols
        }catch let error as DecodingError{
            throw SPDataManager.Error.decodingFailed(type: "Symbol", error: error)
        }catch {
            throw SPDataManager.Error.otherError(error: error)
        }
    }
    
    func fetchEmojis() async throws(SPDataManager.Error) -> [SPEmoji] {
        let supportedLocale = resolveLocaleIdentifier()
        let data = try getEmojiData(for: supportedLocale)
        let decoder = JSONDecoder()
        do{
            let decodedEmojis = try decoder.decode([SPEmoji].self, from: data)
            let filteredEmojis = decodedEmojis.filter{ $0.isAvailable() }
            return filteredEmojis
        }catch let error as DecodingError{
            throw SPDataManager.Error.decodingFailed(type: "Emoji", error: error)
        }catch {
            throw SPDataManager.Error.otherError(error: error)
        }
    }

    private func getSymbolsData(for locale: String) throws(SPDataManager.Error) -> Data {
        let bundle = Bundle.module
        let fileNameLocale = "symbols_\(locale).json"
        let fileNameFallback = "symbols_\(Self.fallbackLocale).json"
        
        guard let urlLocale = bundle.url(forResource: fileNameLocale, withExtension: nil) else {
            throw Error.bundleURLNotCreated(fileName: fileNameLocale)
        }
        guard let urlFallback = bundle.url(forResource: fileNameFallback, withExtension: nil) else {
            throw Error.bundleURLNotCreated(fileName: fileNameFallback)
        }
        
        do{
            return try Data(contentsOf: urlLocale)
        }catch{
            do{
                return try Data(contentsOf: urlFallback)
            }catch{
                throw Error.fileNotFound(fileName: fileNameFallback)
            }
        }
    }
    
    private func getEmojiData(for locale: String) throws(SPDataManager.Error) -> Data {
        let bundle = Bundle.module
        let fileNameLocale = "emojis_\(locale).json"
        let fileNameFallback = "emojis_\(Self.fallbackLocale).json"
        
        guard let urlLocale = bundle.url(forResource: fileNameLocale, withExtension: nil) else {
            throw Error.bundleURLNotCreated(fileName: fileNameLocale)
        }
        guard let urlFallback = bundle.url(forResource: fileNameFallback, withExtension: nil) else {
            throw Error.bundleURLNotCreated(fileName: fileNameFallback)
        }
        
        do{
            return try Data(contentsOf: urlLocale)
        }catch{
            do{
                return try Data(contentsOf: urlFallback)
            }catch{
                throw Error.fileNotFound(fileName: fileNameFallback)
            }
        }
    }
    
    private func resolveLocaleIdentifier() -> String {
        let supportedLocales = getSupportedLocales()
        if #available(iOS 16.0, *){
            guard let identifier = Locale.current.language.languageCode?.identifier else { return Self.fallbackLocale }
            guard let region = Locale.current.language.region?.identifier else { return Self.fallbackLocale }
            let languageWithRegion = "\(identifier)_\(region)"
            
            
            if supportedLocales.contains(languageWithRegion){
               return languageWithRegion
            }else if supportedLocales.contains(identifier){
                return identifier
            }else{
                return Self.fallbackLocale
            }
            
        }else{
            guard let identifier = Locale.current.languageCode else { return Self.fallbackLocale }
            guard let region = Locale.current.regionCode else { return Self.fallbackLocale }
            let languageWithRegion = "\(identifier)_\(region)"
            
            if supportedLocales.contains(languageWithRegion){
               return languageWithRegion
            }else if supportedLocales.contains(identifier){
                return identifier
            }else{
                return Self.fallbackLocale
            }
        }
    }
    
    private func getSupportedLocales() -> [String] {
        let bundle = Bundle.module
        guard let resourceURL = bundle.resourceURL else {
            return [Self.fallbackLocale]
        }

        let fileManager = FileManager.default
        let files = (try? fileManager.contentsOfDirectory(at: resourceURL, includingPropertiesForKeys: nil)) ?? []
        let locales = files.compactMap { url -> String? in
            let name = url.lastPathComponent
            guard name.hasPrefix("emojis_") && name.hasSuffix(".json") else {
                return nil
            }
            let startIndex = name.index(name.startIndex, offsetBy: "emojis_".count)
            let endIndex = name.index(name.endIndex, offsetBy: -".json".count)
            let locale = String(name[startIndex..<endIndex])
            
            return locale.isEmpty ? nil : locale
        }

        let uniqueLocales = Array(Set(locales)).sorted()
        return uniqueLocales.isEmpty ? [Self.fallbackLocale] : uniqueLocales
    }
    
}
