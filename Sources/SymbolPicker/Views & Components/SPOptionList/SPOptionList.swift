//
//  SPOptionList.swift
//  SymbolPicker
//
//  Refactored for modularity, performance, and improved skin selection.
//

import SwiftUI
import PhotosUI
import SearchBar
import ColorKit

// MARK: - Main View
public struct SPOptionList: View {
    @Environment(\.spSearchText) private var searchText
    @Environment(\.spSelection) private var spSelection
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.spPageType) private var pageType
    @Environment(\.symbolPickerStyle) private var style
    @State private var emojiForSkinPicker: SPEmoji?
    private let dataManager = SPDataManager()
    private var currentSize: CGFloat{ SPSpacing.getSize(in: dynamicTypeSize, for: style.spacing.optionList) }

    private var columns: [GridItem] {[GridItem(.adaptive(minimum: currentSize, maximum: currentSize * 1.2), spacing: currentSize * 0.8)]}

    public var body: some View {
        SPOptionListContainerView{
            #if os(iOS) || os(macOS) || os(visionOS)
            if #available(iOS 16.0, macOS 14.0, *) {
                SPOptionListImage()
            }
            #endif
        } symbolView: { symbols in
            SPOptionListSectionGrid(
                data: symbols,
                columns: columns,
                spacing: currentSize * 0.3
            ) { symbol in
                SPOptionListCell(symbol: symbol, size: currentSize)
            }
        } emojiView: { emojis in
            SPOptionListSectionGrid(
                data: emojis,
                columns: columns,
                spacing: currentSize * 0.3
            ) { emoji in
                SPOptionListCell(emoji: emoji, size: currentSize, columns: columns, onShowSkins: { emojiForSkinPicker = $0 })
            }
        }
        #if os(watchOS) || os(tvOS)
        .sheet(item: $emojiForSkinPicker) { emoji in
            SPOptionListSkinView(selection: spSelection, emoji: emoji, size: currentSize, columns: columns)
        }
        #endif

    }
    public init() {}
}
