//
//  SPSymbol-Codable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPSymbol: Codable{
    @_documentation(visibility: internal)
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
