//
//  SPSelectionView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI
import ColorKit

public struct SPSelectionView<T: SPDataAsset>: View {
    private var selection: SPSelection<T>?
    
    public var body: some View {
        Group {
            if let selection{
                switch selection {
                case .symbol(let symbol, _):
                    symbol.asView()
                case .emoji(let emoji, _):
                    SPEmojiView(emoji: emoji)
                case .image(let image, _):
                    SPImageView(image: image)
                case .color(let color):
                    Circle().fill(color)
                }
            }else{
                EmptyView()
            }
        }
        .id(selection?.id)
    }
    
    public init(selection: SPSelection<T>?) {
        self.selection = selection
    }
}
