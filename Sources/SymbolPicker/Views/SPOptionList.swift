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
    @Environment(\.spSelection) private var selection
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.spPageType) private var pageType
    
    @State private var symbols: [SPCategory<SPSymbol>] = []
    @State private var emojis: [SPCategory<SPEmoji>] = []
    @State private var isLoading = false
    
    private let dataManager = SPDataManager()
    
    private var baseSize: CGFloat {
        switch dynamicTypeSize {
        case .xSmall: return 18
        case .small: return 20
        case .medium: return 22
        case .large: return 24
        case .xLarge: return 26
        case .xxLarge: return 28
        case .xxxLarge: return 30
        default: return 32
        }
    }
    
    private var currentSize: CGFloat {
        #if os(macOS)
        return baseSize
        #elseif os(tvOS)
        return baseSize * 2.5
        #elseif os(visionOS)
        return baseSize * 1.25
        #else
        return baseSize * 1.40
        #endif
    }
    
    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: currentSize, maximum: currentSize * 1.2), spacing: currentSize * 0.8)]
    }
    
    public var body: some View {
        Group {
            if isLoading && symbols.isEmpty && emojis.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                if pageType.wrappedValue == .symbol{
                    ScrollView{
                        SectionedGridView(
                            data: symbols,
                            columns: columns,
                            spacing: currentSize * 0.3
                        ) { symbol in
                            SymbolCell(symbol: symbol, size: currentSize)
                        }
                        .if { content in
                            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, *) {
                                content.scrollTargetLayout()
                            } else {
                                content
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                    }
                }else if pageType.wrappedValue == .emoji{
                    ScrollView{
                        SectionedGridView(
                            data: emojis,
                            columns: columns,
                            spacing: currentSize * 0.3
                        ) { emoji in
                            EmojiCell(emoji: emoji, size: currentSize, columns: columns)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                    }
                }else{
                    #if os(iOS) || os(macOS) || os(visionOS)
                    if #available(iOS 16.0, macOS 14.0, *) {
                        List{
                            PhotosPicker("Select Image", selection: selection.asImage)
                        }
                        .safeAreaInset(edge: .bottom){
                            ImageSelectButton(photoImage: selection.asImage)
                        }
                        #if os(macOS)
                        .listStyle(.sidebar)
                        #endif
                    }else{
                        EmptyView()
                    }
                    #else
                    EmptyView()
                    #endif
                }
            }
        }
        .task(id: searchText.wrappedValue) { await performSearch() }
        .task(id: pageType.wrappedValue) { await loadData() }
    }
    
    // MARK: - Logic
    
    private func performSearch() async {
        do {
            switch pageType.wrappedValue {
            case .symbol:
                self.symbols = try await dataManager.search(SPSymbol.self, for: searchText.wrappedValue)
            case .emoji:
                self.emojis = try await dataManager.search(SPEmoji.self, for: searchText.wrappedValue)
            default: break
            }
        } catch {
            print("Search failed: \(error)")
        }
    }
    
    private func loadData() async {
        searchText.wrappedValue = ""
        guard symbols.isEmpty && emojis.isEmpty else { return }
        isLoading = true
        do {
            async let symbolsData = dataManager.fetch(type: SPSymbol.self)
            async let emojisData = dataManager.fetch(type: SPEmoji.self)
            let (fetchedSymbols, fetchedEmojis) = try await (symbolsData, emojisData)
            self.symbols = fetchedSymbols
            self.emojis = fetchedEmojis
        } catch {
            print("Data failed to load: \(error)")
        }
        isLoading = false
    }
    
    public init() {}
}

#if !os(watchOS) && !os(tvOS)
@available(iOS 16.0, macOS 14.0, *)
fileprivate struct ImageSelectButton: View {
    @Binding var photoImage: PhotosPickerItem?
    var body: some View{
        PhotosPicker(selection: $photoImage){
            HStack{
                Spacer()
                Text("Select Image")
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.vertical, 8)
        }
        #if os(visionOS)
        .buttonStyle(.borderedProminent)
        .foregroundStyle(Color.accentColor)
        #else
        .if{ content in
            if #available(iOS 26.0, macOS 26.0, visionOS 26.0, *){
                content
                    .buttonStyle(.glassProminent)
                    .foregroundStyle(Color.accentColor)
            }else{
                content
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(Color.accentColor)
            }
        }
        #endif
        .padding(.horizontal)

    }
}
#endif
// MARK: - Cells

fileprivate struct SymbolCell: View {
    @Environment(\.spSelection) private var selection
    let symbol: SPSymbol
    let size: CGFloat
    
    var body: some View {
        Button {
            selection.wrappedValue.setSymbol(symbol)
        } label: {
            SPSymbolView(symbol: symbol)
        }
        .buttonStyle(CellButtonStyle(isSelected: selection.wrappedValue.getSymbol() == symbol, size: size))
    }
}

fileprivate struct EmojiCell: View {
    @Environment(\.spSelection) private var selection
    let emoji: SPEmoji
    let size: CGFloat
    let columns: [GridItem]
    
    @State private var showSkinPicker = false
    
    private var isSelected: Bool {
        guard let selectedEmoji = selection.wrappedValue.getEmoji() else { return false }
        return selectedEmoji.id == emoji.id
    }
    
    var body: some View {
        Button {
            if let skins = emoji.skins, !skins.isEmpty {
                showSkinPicker = true
            } else {
                selection.wrappedValue.setEmoji(emoji)
            }
        } label: {
            if isSelected, let selectedEmoji = selection.wrappedValue.getEmoji() {
                SPEmojiView(emoji: selectedEmoji)
            } else {
                SPEmojiView(emoji: emoji)
            }
        }
        .buttonStyle(CellButtonStyle(isSelected: isSelected, size: size))
        #if !os(watchOS) && !os(tvOS)
        .spPopover(isPresented: $showSkinPicker, arrowEdge: .bottom) {
            SkinSelectionView(selection: selection, emoji: emoji, size: size, columns: columns)
        }
        #endif
    }
}

// MARK: - Skin Selection

fileprivate struct SkinSelectionView: View {
    @Binding var selection: SPSelection
    let emoji: SPEmoji
    let size: CGFloat
    let columns: [GridItem]
    
    private var selectedEmoji: SPEmoji? {
        selection.getEmoji()
    }
    
    private var isThisEmojiSelected: Bool {
        selectedEmoji?.id == emoji.id
    }
    
    var body: some View {
        VStack(spacing: 0) {
            LazyVGrid(columns: columns, alignment: .center, spacing: size * 0.3) {
                // Default variant (tone 0)
                Button {
                    var baseEmoji = emoji
                    baseEmoji.tone = 0
                    selection.setEmoji(baseEmoji)
                } label: {
                    SPEmojiView(emoji: emojiWithTone(0))
                }
                .buttonStyle(CellButtonStyle(
                    isSelected: isThisEmojiSelected && (selectedEmoji?.tone ?? 0) == 0,
                    size: size
                ))
                
                // Skin variants
                if let skins = emoji.skins {
                    ForEach(skins.indices, id: \.self) { index in
                        Button {
                            selection.setEmoji(emojiWithTone(index + 1))
                        } label: {
                            SPEmojiSkinView(skin: skins[index])
                        }
                        .buttonStyle(CellButtonStyle(
                            isSelected: isThisEmojiSelected && selectedEmoji?.tone == index + 1,
                            size: size
                        ))
                    }
                }
            }
            .padding()
        }
        .frame(idealWidth: size * 11)
        #if os(macOS) || os(visionOS)
        .frame(width: size * 12)
        #endif
    }
    
    private func emojiWithTone(_ tone: Int) -> SPEmoji {
        var newEmoji = emoji
        newEmoji.tone = tone
        return newEmoji
    }
}

// MARK: - Reusable Components

fileprivate struct SectionedGridView<T: SPDataAsset, Content: View>: View {
    let data: [SPCategory<T>]
    let columns: [GridItem]
    let spacing: CGFloat
    let content: (T) -> Content
    
    var body: some View {
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

fileprivate struct CellButtonStyle: ButtonStyle {
    @Environment(\.isFocused) private var isFocused
    let isSelected: Bool
    let size: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size, height: size * 1.25, alignment: .center)
            .padding(size * 0.25)
            .foregroundStyle(Color.primary)
            .background {
                if configuration.isPressed {
                    Color.primary.opacity(0.10)
                } else if isSelected {
                    #if os(iOS)
                    Color.primary.opacity(0.15)
                    #else
                    Color.primary.opacity(0.20)
                    #endif
                } else {
                    Color.clear
                }
            }
            #if os(watchOS)
            .clipShape(RoundedRectangle(cornerRadius: size * 0.45, style: .continuous))
            #else
            .clipShape(RoundedRectangle(cornerRadius: size * 0.25, style: .continuous))
            #endif
            #if os(tvOS)
            .if { content in
                if #available(tvOS 17.0, *) {
                    content.hoverEffect(.highlight)
                } else {
                    content
                        .scaleEffect(isFocused ? 1.1 : 1.0)
                        .background {
                            RoundedRectangle(cornerRadius: size * 0.25, style: .continuous)
                                .fill(!isSelected && isFocused ? Color.primary.opacity(0.15) : Color.clear)
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
}

fileprivate struct HeaderView: View {
    let title: String
    
    var body: some View {
        Text(title.capitalized)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 8)
    }
}
