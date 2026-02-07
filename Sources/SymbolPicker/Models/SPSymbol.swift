//
//  SPSymbol.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

public nonisolated struct SPSymbol: Identifiable, Equatable, Hashable, Codable, View, Sendable {
    public let id: String
    public let filledName: String
    public let notFilled: String
    public let version: Double
    public var variant: SPSymbolVariant? = nil
    public let category: String?
    public let subcategory: String?
    public let tags: [String]?
    
    public var body: some View{
        SPSymbolView(symbol: self)
    }
    
    public func isAvailable() -> Bool {
        #if canImport(UIKit)
        return UIImage(systemName: filledName) != nil && UIImage(systemName: notFilled) != nil
        #elseif canImport(AppKit)
        return NSImage(systemSymbolName: filledName, accessibilityDescription: nil) != nil
            && NSImage(systemSymbolName: notFilled, accessibilityDescription: nil) != nil
        #else
        return false
        #endif
    }
    
    init(filledName: String, notFilled: String, version: Double, variant: SPSymbolVariant? = nil, category: String? = nil, subcategory: String? = nil, tags: [String]? = nil) {
        self.id = filledName
        self.filledName = filledName
        self.notFilled = notFilled
        self.version = version
        self.variant = variant
        self.category = category
        self.subcategory = subcategory
        self.tags = tags
    }
    
    enum CodingKeys: CodingKey{
        case annotation
        case filledName
        case notFilled
        case version
        case variant
        case category
        case subcategory
        case tags
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let filledName = try container.decode(String.self, forKey: .filledName)
        let notFilled = try container.decode(String.self, forKey: .notFilled)
        let version = try container.decodeIfPresent(Double.self, forKey: .version) ?? 0
        let variant = try container.decodeIfPresent(SPSymbolVariant.self, forKey: .variant)
        let category = try container.decodeIfPresent(String.self, forKey: .category)
        let subcategory = try container.decodeIfPresent(String.self, forKey: .subcategory)
        let tags = try container.decodeIfPresent([String].self, forKey: .tags)
        
        self.init(
            filledName: filledName,
            notFilled: notFilled,
            version: version,
            variant: variant,
            category: category,
            subcategory: subcategory,
            tags: tags
        )
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(filledName, forKey: .filledName)
        try container.encode(notFilled, forKey: .notFilled)
        try container.encode(version, forKey: .version)
        try container.encodeIfPresent(variant, forKey: .variant)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(subcategory, forKey: .subcategory)
        try container.encodeIfPresent(tags, forKey: .tags)
    }
}

struct SPSymbolView: View {
    @Environment(\.symbolVariant) var symbolVariant
    let symbol: SPSymbol
    var body: some View {
        switch symbol.variant {
        case .filled:
            Image(systemName: symbol.filledName)
        case .outlined:
            Image(systemName: symbol.notFilled)
        default:
            switch symbolVariant{
            case .filled:
                Image(systemName: symbol.filledName)
            case .outlined:
                Image(systemName: symbol.notFilled)
            }
        }
        
    }
}

