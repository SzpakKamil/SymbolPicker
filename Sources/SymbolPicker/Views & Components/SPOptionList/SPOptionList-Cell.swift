//
//  SPOptionListCell.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPOptionListCell: View {
    @Environment(\.spSelection) private var selection
    @FocusState private var isFocused: Bool
    let symbol: SPSymbol?
    let emoji: SPEmoji?
    let size: CGFloat
    let columns: [GridItem]
    let onShowSkins: (SPEmoji) -> Void
    
    @State private var showSkinPicker = false
    
    private var isSelected: Bool {
        if let symbol{
            guard let selectedSymbol = selection.wrappedValue.getSymbol() else { return false }
            return selectedSymbol.id == symbol.id
        }else if let emoji{
            guard let selectedEmoji = selection.wrappedValue.getEmoji() else { return false }
            return selectedEmoji.id == emoji.id
        }else{
            return false
        }

    }
    
    var body: some View {
        Button {
            if let symbol{
                var updatedSelection = selection.wrappedValue
                updatedSelection.setSymbol(symbol)
                selection.wrappedValue = updatedSelection
            }else if let emoji{
                let availableSkins = emoji.skins?.filter { $0.isAvailable() } ?? []
                if !availableSkins.isEmpty {
                    #if os(watchOS) || os(tvOS)
                    onShowSkins(emoji)
                    #else
                    showSkinPicker = true
                    #endif
                } else {
                    var updatedSelection = selection.wrappedValue
                    updatedSelection.setEmoji(emoji)
                    selection.wrappedValue = updatedSelection
                }
            }
        } label: {
            if let symbol{
                SPSymbolView(symbol: symbol)
            }else if let emoji{
                if isSelected, let selectedEmoji = selection.wrappedValue.getEmoji() {
                    SPEmojiView(emoji: selectedEmoji)
                } else {
                    SPEmojiView(emoji: emoji)
                }
            }

        }
        .focused($isFocused)
        .buttonStyle(SPOptionListButtonStyle(isSelected: isSelected, isFocused: isFocused, size: size))
        .accessibilityElement()
        .accessibilityLabel(symbol != nil ? symbol?.annotation ?? SPPageType.symbol.localizedDescription : emoji?.annotation ?? SPPageType.emoji.localizedDescription)
        .accessibilityAddTraits(.isButton)
        #if !os(watchOS) && !os(tvOS)
        .if{ content in
            if let emoji{
                content
                    .spPopover(isPresented: $showSkinPicker, arrowEdge: .bottom) {
                        SPOptionListSkinView(selection: selection, emoji: emoji, size: size, columns: columns)
                    }
            }else{
                content
            }
        }

        #endif
    }
    
    init(emoji: SPEmoji, size: CGFloat, columns: [GridItem], onShowSkins: @escaping (SPEmoji) -> Void = {_ in}) {
        self.symbol = nil
        self.emoji = emoji
        self.columns = columns
        self.size = size
        self.onShowSkins = onShowSkins
    }
    
    init(symbol: SPSymbol, size: CGFloat) {
        self.symbol = symbol
        self.emoji = nil
        self.columns = []
        self.size = size
        self.onShowSkins = {_ in}
    }
}
