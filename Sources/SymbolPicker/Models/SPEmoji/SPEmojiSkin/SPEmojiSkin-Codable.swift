//
//  SPEmojiSkin-Codable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

extension SPEmoji.Skin: Codable{
    enum CodingKeys: CodingKey{
        case annotation
        case hexcode
        case version
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let hexcode = try container.decode(String.self, forKey: .hexcode)
        self.id = hexcode
        self.annotation = try container.decodeIfPresent(String.self, forKey: .annotation)
        self.version = try container.decodeIfPresent(Double.self, forKey: .version) ?? 0
        
    }
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .hexcode)
        try container.encodeIfPresent(annotation, forKey: .annotation)
        try container.encode(version, forKey: .version)
    }
}
