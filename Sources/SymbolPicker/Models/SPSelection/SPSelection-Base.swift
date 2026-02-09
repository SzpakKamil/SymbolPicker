//
//  SPSelection-Base.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 06/02/2026.
//

import SwiftUI


public nonisolated enum SPSelection: Identifiable, Sendable {
    case symbol(value: SPSymbol, color: SPColor? = nil)
    case emoji(value: SPEmoji, color: SPColor? = nil)
    case image(value: SPImage)
    
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
}
