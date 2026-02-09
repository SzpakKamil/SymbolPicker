//
//  SPSelection-Codable.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 06/02/2026.
//

import SwiftUI


extension SPSelection: Codable{
    enum CodingKeys: CodingKey {
        case type
        case symbol
        case emoji
        case image
        case tint
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(SelectionType.self, forKey: .type)
        switch type {
        case .symbol:
            let symbol = try container.decode(SPSymbol.self, forKey: .symbol)
            let tint = try container.decodeIfPresent(SPColor.self, forKey: .tint)
            self = .symbol(value: symbol, color: tint)
        case .emoji:
            let emoji = try container.decode(SPEmoji.self, forKey: .emoji)
            let tint = try container.decodeIfPresent(SPColor.self, forKey: .tint)
            self = .emoji(value: emoji, color: tint)
        case .image:
            let image = try container.decode(SPImage.self, forKey: .image)
            self = .image(value: image)
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .symbol(let symbol, let tint):
            try container.encode(SelectionType.symbol, forKey: .type)
            try container.encode(symbol, forKey: .symbol)
            try container.encodeIfPresent(tint, forKey: .tint)
        case .emoji(let emoji, let tint):
            try container.encode(SelectionType.emoji, forKey: .type)
            try container.encode(emoji, forKey: .emoji)
            try container.encodeIfPresent(tint, forKey: .tint)
        case .image(let image):
            try container.encode(SelectionType.image, forKey: .type)
            try container.encode(image, forKey: .image)
        }
    }
}
