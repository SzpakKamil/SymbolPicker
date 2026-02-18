//
//  SPColorPicker.swift
//  SymbolPicker
//
//  Refactored for modularity and performance.
//

import SwiftUI
import PhotosUI
import SearchBar
import ColorKit

// MARK: - Main View
public struct SPOptionList: View {
    @Environment(\.spSearchText) private var searchText
    @Environment(\.spSelection) private var selection
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.spPageType) private var pageType
    @State private var symbols: [SPCategory<SPSymbol>] = []
    @State private var emojis: [SPCategory<SPEmoji>] = []
    
    var sizes: [DynamicTypeSize: CGFloat] = [
        .xSmall : 23,
        .small  : 23,
        .medium : 23,
        .large  : 23,
    ]
    
    private var currentSize: CGFloat{
        #if os(macOS)
        (sizes[dynamicTypeSize] ?? 0)
        #elseif os(iOS) || os(watchOS)
        (sizes[dynamicTypeSize] ?? 0) * 1.40
        #elseif os(tvOS)
        (sizes[dynamicTypeSize] ?? 0) * 2.5
        #elseif os(visionOS)
        (sizes[dynamicTypeSize] ?? 0) * 1.25
        #else
        (sizes[dynamicTypeSize] ?? 0) * 1.40
        #endif
    }
    
    private let dataManager = SPDataManager()
    var columns: [GridItem] {[GridItem(.adaptive(minimum: currentSize, maximum: currentSize * 1.2), spacing: currentSize * 0.8)]}
    public var body: some View {
        Group {
            switch pageType.wrappedValue {
            case .symbol:
                SectionedGridView(
                    data: symbols,
                    columns: columns,
                    spacing: currentSize * 0.3
                ) { symbol in
                    Button{
                        selection.wrappedValue.setSymbol(symbol)
                    }label:{
                        SPSymbolView(symbol: symbol)
                    }
                    .buttonStyle(CellButtonStyle(isSelected: selection.wrappedValue.getSymbol() == symbol, size: currentSize))
                }
                .if{ content in
                    if #available(iOS 17.0, macOS 14.0, tvOS 17.0, *){ content.scrollTargetLayout() }else{ content }
                }
            case .emoji:
                SectionedGridView(
                    data: emojis,
                    columns: columns,
                    spacing: currentSize * 0.3
                ) { emoji in
                    SPEmojiCell(
                        selection: selection,
                        emoji: emoji,
                        size: currentSize,
                        columns: columns,
                    )
                }
            case .image:
                Text("Image Picker Placeholder")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .task(id: searchText.wrappedValue) { await performSearch() }
        .task(id: pageType.wrappedValue) { await loadData() }
    }
    
    // MARK: - Logic
    
    private func performSearch() async {
        do{
            switch pageType.wrappedValue{
            case .symbol:
                self.symbols = try await dataManager.search(SPSymbol.self, for: searchText.wrappedValue)
            case .emoji:
                self.emojis = try await dataManager.search(SPEmoji.self, for: searchText.wrappedValue)
            default: break
            }
        } catch {
            print("Data failed to load")
        }
    }
    
    private func loadData() async {
        do{
            async let symbols = dataManager.fetch(type: SPSymbol.self)
            async let emojis = dataManager.fetch(type: SPEmoji.self)
            self.symbols = try await symbols
            self.emojis = try await emojis
        } catch {
            print("Data failed to load")
        }
    }
    
    public init() {}
}

fileprivate struct SPEmojiCell: View {
    @Binding var selection: SPSelection
    let emoji: SPEmoji
    let size: CGFloat
    let columns: [GridItem]
    
    @State private var showSkinPicker = false

    var body: some View {
        let isSelected = selection.getEmoji() == emoji
        Button {
            if let skins = emoji.skins, !skins.isEmpty {
                showSkinPicker = true
            } else {
                selection.setEmoji(emoji)
            }
        } label: {
            if let selectedEmoji = selection.getEmoji(), isSelected{
                SPEmojiView(emoji: selectedEmoji)
            }else{
                SPEmojiView(emoji: emoji)
            }
        }
        .buttonStyle(CellButtonStyle(isSelected: isSelected, size: size))
        #if os(iOS) || os(macOS) || os(visionOS)
        .popover(isPresented: $showSkinPicker) {
            if let selectedEmoji = selection.getEmoji(), isSelected{
                SkinSelectionView(selection: $selection, emoji: selectedEmoji, currentSize: size, columns: columns)
            }else{
                SkinSelectionView(selection: $selection, emoji: emoji, currentSize: size, columns: columns)
            }
        }
        #else
        .sheet(isPresented: $showSkinPicker) {
            SkinSelectionView(selection: $selection, emoji: emoji, currentSize: size, columns: columns)
        }
        #endif
    }
}

fileprivate struct SkinSelectionView: View {
    @Binding var selection: SPSelection
    let emoji: SPEmoji?
    let currentSize: CGFloat
    let columns: [GridItem]
    var body: some View {
        if let emoji{
            LazyVGrid(columns: columns, alignment: .center, spacing: currentSize * 0.3) {
                let skins = emoji.skins ?? []
                var defaultEmoji: SPEmoji{
                    var newEmoji = emoji
                    newEmoji.tone = 0
                    return newEmoji
                }
                Button{
                    selection.setEmoji(defaultEmoji)
                }label:{
                    SPEmojiView(emoji: defaultEmoji)
                }
                .buttonStyle(CellButtonStyle(isSelected: selection.getEmoji()?.tone == 0 && selection.getEmoji() == emoji, size: currentSize))
                ForEach(skins.indices){ index in
                    let skin = skins[index]
                    Button{
                        var newEmoji = emoji
                        newEmoji.tone = index + 1
                        selection.setEmoji(newEmoji)
                    }label:{
                        SPEmojiSkinView(skin: skin)
                    }
                    .buttonStyle(CellButtonStyle(isSelected: selection.getEmoji()?.tone == index + 1  && selection.getEmoji() == emoji, size: currentSize))
                }
            }
            .frame(width: currentSize * 11)
            .padding()
            #if os(iOS)
            .if{ content in if #available(iOS 16.4, *){ content.presentationCompactAdaptation(.popover) }else{ content } }
            #endif
        }
    }
}

// MARK: - Reusable Components
fileprivate struct SectionedGridView<T: SPDataAsset, Content: View>: View {
    let data: [SPCategory<T>]
    let columns: [GridItem]
    let spacing: CGFloat
    let content: (T) -> Content
    
    var body: some View {
        if data.isEmpty {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                ForEach(data, id: \.category) { section in
                    Section(header: HeaderView(title: section.category)) {
                        ForEach(section.elements) { item in
                            content(item)
                        }
                    }
                }
            }
        }
    }

}


fileprivate struct CellButtonStyle: ButtonStyle{
    @Environment(\.isFocused) private var isFocused
    let isSelected: Bool
    let size: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size, height: size * 1.25, alignment: .center)
            .padding(size * 0.25)
            .foregroundStyle(Color.primary)
            .background {
                if configuration.isPressed{
                    Color.primary.opacity(0.10)
                }else if isSelected{
                    #if os(iOS)
                    Color.primary.opacity(0.15)
                    #else
                    Color.primary.opacity(0.20)
                    #endif
                }else{
                    Color.clear
                }
            }
            #if os(watchOS)
            .clipShape(RoundedRectangle(cornerRadius: size * 0.45, style: .continuous))
            #else
            .clipShape(RoundedRectangle(cornerRadius: size * 0.25, style: .continuous))
            #endif
            #if os(tvOS)
            .if{ content in
                if #available(tvOS 17.0, *){
                    content.hoverEffect(.highlight)
                }else{
                content
                    .scaleEffect(isFocused ? 1.1 : 1.0)
                    .background{
                        RoundedRectangle(cornerRadius: size * 0.25, style: .continuous)
                            .fill(!isSelected && isFocused ?  Color.primary.opacity(0.15) : Color.clear)
                    }
                    .animation(.smooth, value: isFocused)
                }
            }
            #elseif os(visionOS)
            .hoverEffect(.lift)
            .clipShape(RoundedRectangle(cornerRadius: size * 0.45, style: .continuous))
            #endif
            .animation(.smooth(duration: 0.2), value: isSelected)
            .animation(.smooth(duration: 0.2), value: configuration.isPressed)
        
    }
    
    init(isSelected: Bool, size: CGFloat) {
        self.isSelected = isSelected
        self.size = size
    }
}

fileprivate struct HeaderView: View {
    let title: String
    
    var body: some View {
        Text(title.capitalized)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
