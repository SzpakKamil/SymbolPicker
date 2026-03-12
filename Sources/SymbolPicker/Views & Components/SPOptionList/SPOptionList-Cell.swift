//
//  SPOptionListCell.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPOptionListCell<T: SPDataAsset>: View {
    @Environment(\.symbolPickerStyle) private var symbolPickerStyle
    @Binding var selection: SPSelection<T>
    @FocusState private var isFocused: Bool
    let symbol: T?
    let emoji: SPEmoji?
    let size: CGFloat
    let columns: [GridItem]
    let onShowSkins: (SPEmoji) -> Void
    
    @State private var showSkinPicker = false
    
    private var isSelected: Bool {
        if let symbol{
            guard let selectedSymbol = selection.getSymbol() else { return false }
            return selectedSymbol.id == symbol.id
        }else if let emoji{
            guard let selectedEmoji = selection.getEmoji() else { return false }
            return selectedEmoji.id == emoji.id
        }else{
            return false
        }

    }
    
    var body: some View {
        Button {
            if let symbol{
                var updatedSelection = selection
                updatedSelection.setSymbol(symbol)
                selection = updatedSelection
            }else if let emoji{
                let availableSkins = emoji.skins?.filter { $0.isAvailable() } ?? []
                if !availableSkins.isEmpty {
                    #if os(watchOS) || os(tvOS)
                    onShowSkins(emoji)
                    #else
                    showSkinPicker = true
                    #endif
                } else {
                    var updatedSelection = selection
                    updatedSelection.setEmoji(emoji)
                    selection = updatedSelection
                }
            }
        } label: {
            if let symbol{
                symbol.asView()
            }else if let emoji{
                if isSelected, let selectedEmoji = selection.getEmoji() {
                    SPEmojiView(emoji: selectedEmoji)
                } else {
                    SPEmojiView(emoji: emoji)
                }
            }
        }
        #if os(tvOS)
        .if{ content in if #unavailable(tvOS 26.0){ content.focused($isFocused)}else{content} }
        #endif
        .buttonStyle(SPOptionListButtonStyle(isSelected: isSelected, isFocused: isFocused, size: size))
        .accessibilityElement()
        .accessibilityLabel(symbol != nil ? symbol?.annotation ?? SPPageType.symbol.localizedDescription : emoji?.annotation ?? SPPageType.emoji.localizedDescription)
        .accessibilityAddTraits(.isButton)
        #if !os(watchOS) && !os(tvOS)
        .if{ content in
            if let emoji{
                content
                    .spPopover(isPresented: $showSkinPicker, arrowEdge: .bottom) {
                        SPOptionListSkinView(selection: $selection, emoji: emoji, size: size, columns: columns)
                    }
            }else{
                content
            }
        }

        #endif
    }
    
    init(selection: Binding<SPSelection<T>>, emoji: SPEmoji, size: CGFloat, columns: [GridItem], onShowSkins: @escaping (SPEmoji) -> Void = {_ in}) {
        self._selection = selection
        self.symbol = nil
        self.emoji = emoji
        self.columns = columns
        self.size = size
        self.onShowSkins = onShowSkins
    }
    
    init(selection: Binding<SPSelection<T>>, symbol: T, size: CGFloat) {
        self._selection = selection
        self.symbol = symbol
        self.emoji = nil
        self.columns = []
        self.size = size
        self.onShowSkins = {_ in}
    }
}
