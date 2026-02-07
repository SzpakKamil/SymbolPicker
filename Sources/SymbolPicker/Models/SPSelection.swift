//
//  SPSelection.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 06/02/2026.
//

import SwiftUI

public nonisolated enum SPSelection: Identifiable, Equatable, Hashable, Codable, View, Sendable {
    case symbol(value: SPSymbol, color: SPColor? = nil)
    case emoji(value: SPEmoji, color: SPColor? = nil)
    case image(SPImage)
    
    
    public var body: some View{
        switch self {
        case .symbol(let value, _):
            value
        case .emoji(let value, _):
            value
        case .image(let image):
            image
        }
    }

    public var id: String {
        switch self {
        case .symbol(let symbol, let color):
            if let color {
                return "symbol:\(symbol.id):\(color.id)"
            }
            return "symbol:\(symbol.id)"
        case .emoji(let emoji, let color):
            if let color {
                return "emoji:\(emoji.id):\(color.id)"
            }
            return "emoji:\(emoji.id)"
        case .image(let image):
            return "image:\(image.id)"
        }
    }

    public mutating func setColor(_ color: SPColor?) {
        switch self {
        case .symbol(let symbol, _):
            self = .symbol(value: symbol, color: color)
        case .emoji(let emoji, _):
            self = .emoji(value: emoji, color: color)
        case .image:
            break
        }
    }

    public mutating func setSymbol(_ symbol: SPSymbol) {
        switch self {
        case .symbol(_, let color):
            self = .symbol(value: symbol, color: color)
        case .emoji(_, let color):
            self = .symbol(value: symbol, color: color)
        case .image:
            self = .symbol(value: symbol, color: nil)
        }
    }

    public mutating func setEmoji(_ emoji: SPEmoji) {
        switch self {
        case .symbol(_, color: let color):
            self = .emoji(value: emoji, color: color)
        case .emoji(_, let color):
            self = .emoji(value: emoji, color: color)
        case .image:
            self = .emoji(value: emoji, color: nil)
        }
    }

    public mutating func setImage(_ image: SPImage) {
        self = .image(image)
    }

    enum CodingKeys: CodingKey {
        case type
        case symbol
        case emoji
        case image
        case tint
    }

    enum SelectionType: String, Codable {
        case symbol
        case emoji
        case image
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
            self = .image(image)
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
