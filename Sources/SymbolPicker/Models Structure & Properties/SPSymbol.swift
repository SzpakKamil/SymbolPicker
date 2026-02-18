//
//  SPSymbol.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public nonisolated struct SPSymbol: Identifiable, Sendable, SPDataAsset {
    public let id: String
    public let annotation: String?
    public let filledName: String
    public let notFilled: String
    public let version: Double
    public var variant: SPSymbol.Variant? = nil
    public let category: String?
    public let subcategory: String?
    public let tags: [String]?
    
    init(filledName: String, notFilled: String, version: Double, variant: SPSymbol.Variant? = nil, annotation: String? = nil, category: String? = nil, subcategory: String? = nil, tags: [String]? = nil) {
        self.id = "\(filledName)\(category ?? "")"
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

// MARK: - Codable
extension SPSymbol: Codable {
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
}

// MARK: - Equatable
extension SPSymbol: Equatable {
    @_documentation(visibility: internal)
    public static func == (lhs: SPSymbol, rhs: SPSymbol) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Hashable
extension SPSymbol: Hashable {
    @_documentation(visibility: internal)
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Methods
extension SPSymbol {
    static let filePrefix: String = "symbols"
    
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
}


public struct SPSymbolView: View {
    @Environment(\.spSymbolVariant) var symbolVariant
    private let filledName: String
    private let notFilledName: String
    private let isAvailable: Bool
    private let variant: SPSymbol.Variant?
    
    public var body: some View {
        if isAvailable{
            switch variant {
            case .none:
                viewForVariant(symbolVariant)
            default:
                viewForVariant(variant!)
            }
        }else{
            Image(systemName: "questionmark")
        }
    }
    
    private func viewForVariant(_ variant: SPSymbol.Variant) -> some View {
        Image(systemName: variant == .filled ? filledName : notFilledName)
            .resizable()
            .scaledToFit()
            // Force the view to occupy a square space
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
    }
    
    public init(symbol: SPSymbol) {
        self.filledName = symbol.filledName
        self.notFilledName = symbol.notFilled
        self.isAvailable = symbol.isAvailable()
        self.variant = symbol.variant
    }
}
