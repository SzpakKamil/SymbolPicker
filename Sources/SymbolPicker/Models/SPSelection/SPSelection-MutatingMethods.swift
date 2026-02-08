//
//  SPSelection-MutatingMethods.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 06/02/2026.
//

import SwiftUI
import SPColor

extension SPSelection{
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
        self = .image(value: image)
    }
}
