//
//  SPEmoji-Codable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

extension SPEmoji: Codable{
    @_documentation(visibility: internal)
    enum CodingKeys: CodingKey{
        case annotation
        case hexcode
        case version
        case category
        case subcategory
        case tags
        case skins
        case tone
    }
    
    @_documentation(visibility: internal)
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let hexcode = try container.decode(String.self, forKey: .hexcode)
        let version = try container.decodeIfPresent(Double.self, forKey: .version) ?? 0
        let category = try container.decodeIfPresent(String.self, forKey: .category)
        let annotation = try container.decodeIfPresent(String.self, forKey: .annotation)
        let subcategory = try container.decodeIfPresent(String.self, forKey: .subcategory)
        let tags = try container.decodeIfPresent([String].self, forKey: .tags)
        let skins = try container.decodeIfPresent([Skin].self, forKey: .skins)
        let tone = try container.decodeIfPresent(Int.self, forKey: .tone) ?? 0
        
        self.init(
            id: hexcode,
            version: version,
            category: category,
            annotation: annotation,
            subcategory: subcategory,
            tags: tags,
            skins: skins,
            tone: tone
        )
    }
    @_documentation(visibility: internal)
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .hexcode)
        try container.encode(version, forKey: .version)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(annotation, forKey: .annotation)
        try container.encodeIfPresent(subcategory, forKey: .subcategory)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(skins, forKey: .skins)
        try container.encode(tone, forKey: .tone)
    }
    
}
