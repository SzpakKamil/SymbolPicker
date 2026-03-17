//
//  SPSymbol.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public struct SPSymbol: Identifiable, Sendable, SPDataAsset {
    public let id: String
    public let annotation: String?
    public let filledName: String
    public let notFilled: String
    public let version: Double
    public var variant: SPSymbol.Variant? = nil
    public let category: String?
    public let subcategory: String?
    public let tags: [String]?
    
    public init(systemName: String){
        self.id = systemName
        self.filledName = systemName
        self.notFilled = systemName
        self.version = 1.0
        self.variant = nil
        self.annotation = nil
        self.category = nil
        self.subcategory = nil
        self.tags = nil
    }
    
    init(filledName: String, notFilled: String, version: Double = 1.0, variant: SPSymbol.Variant? = nil, annotation: String? = nil, category: String? = nil, subcategory: String? = nil, tags: [String]? = nil) {
        self.id = "\(filledName)\(notFilled)\(category)"
        self.filledName = filledName
        self.notFilled = notFilled
        self.annotation = annotation
        self.version = version
        self.variant = variant
        self.category = category
        self.subcategory = subcategory
        self.tags = tags
    }
    
}

// MARK: - Variant
public extension SPSymbol {
    enum Variant: String, Identifiable, Equatable, Hashable, Codable, Sendable {
        case filled
        case outlined
        
        public var id: String {
            switch self {
            case .filled:
                return "Filled"
            case .outlined:
                return "Outlined"
            }
        }
    }
}

// MARK: - Codable, Equatable, Hashable
extension SPSymbol: Codable, Hashable, Equatable {
    @_documentation(visibility: internal)
    enum CodingKeys: CodingKey {
        case annotation
        case filledName
        case notFilled
        case version
        case variant
        case category
        case subcategory
        case tags
    }
    
    @_documentation(visibility: internal)
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let filledName = try container.decode(String.self, forKey: .filledName)
        let notFilled = try container.decode(String.self, forKey: .notFilled)
        let annotation = try container.decodeIfPresent(String.self, forKey: .annotation)
        let version = try container.decodeIfPresent(Double.self, forKey: .version) ?? 0
        let variant = try container.decodeIfPresent(SPSymbol.Variant.self, forKey: .variant)
        let category = try container.decodeIfPresent(String.self, forKey: .category)
        let subcategory = try container.decodeIfPresent(String.self, forKey: .subcategory)
        let tags = try container.decodeIfPresent([String].self, forKey: .tags)
        
        self.init(
            filledName: filledName,
            notFilled: notFilled,
            version: version,
            variant: variant,
            annotation: annotation,
            category: category,
            subcategory: subcategory,
            tags: tags
        )
    }
    
    @_documentation(visibility: internal)
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(filledName, forKey: .filledName)
        try container.encode(notFilled, forKey: .notFilled)
        try container.encode(version, forKey: .version)
        try container.encodeIfPresent(annotation, forKey: .annotation)
        try container.encodeIfPresent(variant, forKey: .variant)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(subcategory, forKey: .subcategory)
        try container.encodeIfPresent(tags, forKey: .tags)
    }
    
    @_documentation(visibility: internal)
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    @_documentation(visibility: internal)
    public static func == (lhs: SPSymbol, rhs: SPSymbol) -> Bool {
        lhs.id == rhs.id
    }
    
    public func isSelection(of symbol: Self) -> Bool{
        self.filledName == symbol.filledName || self.filledName == symbol.notFilled
    }
}

// MARK: - Methods
extension SPSymbol {
    public static let filePrefix: String = "symbols"
    
    public static func fetchAssets(locale: String) async throws -> [SPSymbol] {
        let bundle = Bundle.module
        let fallbackLocale = "en"
        let names = ["\(filePrefix)_\(locale).json", "\(filePrefix)_\(fallbackLocale).json"]
        
        for name in names {
            try Task.checkCancellation()
            guard let url = bundle.url(forResource: name, withExtension: nil) else { continue }
            do {
                let data = try Data(contentsOf: url)
                let decoded = try JSONDecoder().decode([SPSymbol].self, from: data)
                return decoded.filter{ $0.isAvailable() }.removeDuplicates{ $0.id == $1.id }

            } catch let error as DecodingError {
                 throw SPDataManager.Error.decodingFailed(type: "\(SPSymbol.self)", error: error)
            } catch {
                 throw SPDataManager.Error.otherError(error: error)
            }
        }
        throw SPDataManager.Error.fileNotFound(fileName: "\(filePrefix)_\(locale).json")
    }
    
    public func isAvailable() -> Bool {
        #if canImport(UIKit)
        // Check if UIImage can be initialized with the system names
        return UIImage(systemName: filledName) != nil && UIImage(systemName: notFilled) != nil
        #elseif canImport(AppKit)
        // Check if NSImage can be initialized with the system symbol names
        return NSImage(systemSymbolName: filledName, accessibilityDescription: nil) != nil
            && NSImage(systemSymbolName: notFilled, accessibilityDescription: nil) != nil
        #else
        return false
        #endif
    }
    
    public func isDuplicate(of other: Self) -> Bool {
        self.filledName == other.filledName && self.notFilled == other.notFilled
    }
    
    public func name(for variant: SPSymbol.Variant) -> String {
        variant == .filled ? filledName : notFilled
    }

    @MainActor @ViewBuilder public func asView() -> some View {
        SPSymbolView(symbol: self)
    }
}


