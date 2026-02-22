//
//  SPSelectionView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

public struct SPSelectionView: View {
    private var selection: SPSelection
    
    public var body: some View {
        Group {
            switch selection {
            case .symbol(let symbol, _):
                SPSymbolView(symbol: symbol)
            case .emoji(let emoji, _):
                SPEmojiView(emoji: emoji)
            case .image(let image, _):
                SPImageView(image: image)
            case .color(let color):
                Circle().fill(color)
            }
        }
        .id(selection.id)
    }
    
    public init(selection: SPSelection) {
        self.selection = selection
    }
}
