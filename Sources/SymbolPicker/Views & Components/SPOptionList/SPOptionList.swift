//
//  SPOptionList.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import PhotosUI
import SearchBar
import ColorKit

// MARK: - Main View
public struct SPOptionList<T: SPDataAsset>: View {
    @Environment(\.spSearchText) private var searchText
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.spPageType) private var pageType
    @Environment(\.symbolPickerStyle) private var style
    @Binding var selection: SPSelection<T>
    @State private var emojiForSkinPicker: SPEmoji?
    private let dataManager = SPDataManager()
    private var currentSize: CGFloat {
        style.spacings.getValue(.width, for: .optionList, at: dynamicTypeSize)
    }

    private var columns: [GridItem] {[GridItem(.adaptive(minimum: currentSize, maximum: currentSize * 1.2), spacing: currentSize * 0.8)]}
    
    public var body: some View {
        SPOptionListContainerView{
            #if os(iOS) || os(macOS) || os(visionOS)
            if #available(iOS 16.0, macOS 14.0, *) {
                SPOptionListImage(selection: $selection)
            }
            #endif
        } symbolView: { symbols in
            SPOptionListSectionGrid(
                data: symbols,
                columns: columns,
                spacing: currentSize * 0.3
            ) { symbol in
                SPOptionListCell(selection: $selection, symbol: symbol, size: currentSize)
            }
        } emojiView: { emojis in
            SPOptionListSectionGrid(
                data: emojis,
                columns: columns,
                spacing: currentSize * 0.3
            ) { emoji in
                SPOptionListCell(selection: $selection, emoji: emoji, size: currentSize, columns: columns, onShowSkins: { emojiForSkinPicker = $0 })
            }
        }
        #if os(watchOS) || os(tvOS)
        .sheet(item: $emojiForSkinPicker) { emoji in
            SPOptionListSkinView(selection: $selection, emoji: emoji, size: currentSize, columns: columns)
        }
        #endif

    }
    public init(selection: Binding<SPSelection<T>>) {
        self._selection = selection
    }
}
