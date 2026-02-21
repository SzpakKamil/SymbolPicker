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
    @State private var emojiForSkinPicker: SPEmoji?
    
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
        case .accessibility1: return 32
        case .accessibility2: return 34
        case .accessibility3: return 36
        case .accessibility4: return 38
        case .accessibility5: return 40
        default: return 24
        }
    }
    
    private var currentSize: CGFloat {
        #if os(macOS)
        return baseSize
        #elseif os(tvOS)
        if #available(tvOS 26.0, *){
            return baseSize * 3.5
        }else{
            return baseSize * 4.0
        }
        #elseif os(visionOS)
        return baseSize * 1.25
        #elseif os(watchOS)
        return baseSize * 0.85
        #else
        return baseSize * 1.40
        #endif
    }
    
    var selectedColorBinding: Binding<CKColor>{
        return Binding {
            selection.wrappedValue.getColor() ?? CKColor(red: 0, green: 0, blue: 0, opacity: 1)
        } set: { newValue in
            selection.wrappedValue.setColor(newValue)
        }
    }
    
    private var topView: AnyView? = nil
    private var columns: [GridItem] {[GridItem(.adaptive(minimum: currentSize, maximum: currentSize * 1.2), spacing: currentSize * 0.8)]}
    private var horizontalPadding: CGFloat {
        #if os(tvOS)
        if #available(tvOS 26.0, *) { return 30 } else { return 80 }
        #else
        return 20
        #endif
    }
    
    private var verticalPadding: CGFloat? {
        #if os(tvOS)
        if #available(tvOS 26.0, *) { return 30 } else { return 80 }
        #else
        return nil
        #endif
    }
    
    private var isSearching: Bool { !searchText.wrappedValue.isEmpty }
    private var hasSymbols: Bool { symbols.contains { !$0.elements.isEmpty } }
    private var hasEmojis: Bool { emojis.contains { !$0.elements.isEmpty } }

    public var body: some View {
        Group {
            if isLoading && symbols.isEmpty && emojis.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                if ![SPPageType.emoji, .symbol].contains(pageType.wrappedValue) {
                    #if os(iOS) || os(macOS) || os(visionOS)
                    if #available(iOS 16.0, macOS 14.0, *) {
                        List {
                            ColorPicker(SPTranslation.DetectedColor.localizedDescription, selection: selectedColorBinding.asColor)
                            
                            Section(SPTranslation.Source.localizedDescription) {
                                PhotosPicker(SPTranslation.SelectImage.localizedDescription, selection: selection.asImage)
                            }
                            
                            if let image = selection.wrappedValue.getImage() {
                                Section(SPTranslation.Manipulation.localizedDescription) {
                                    VStack(alignment: .leading) {
                                        Text(SPTranslation.Zoom.localizedDescription)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                        Slider(value: imageZoomBinding(), in: 1.0...5.0)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(SPTranslation.HorizontalOffset.localizedDescription)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                        Slider(value: imageOffsetXBinding(), in: -1.0...1.0)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(SPTranslation.VerticalOffset.localizedDescription)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                        Slider(value: imageOffsetYBinding(), in: -1.0...1.0)
                                    }
                                }
                            }
                        }
                        #if os(macOS)
                        .listStyle(.sidebar)
                        #endif
                    } else {
                        EmptyView()
                    }
                    #else
                    EmptyView()
                    #endif
                } else {
                    let isSymbolPage = pageType.wrappedValue == .symbol
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack {
                                topView
#if os(watchOS) ||  os(tvOS)
                                SearchBar(text: searchText, prompt: isSymbolPage ? SPTranslation.SearchSymbols.localizedDescription : SPTranslation.SearchEmojis.localizedDescription)
                                    .searchBarStyle(.capsule)
                                    .searchBarScale(.medium)
                                    .if{ content in if #available(tvOS 26.0, watchOS 26.0, *){ content.searchBarMaterial(.glass) }else{ content } }
#endif
                                if (isSymbolPage && !hasSymbols) || (!isSymbolPage && !hasEmojis) && isSearching {
                                    EmptyStateView()
                                }else if isSymbolPage && hasSymbols{
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
                                }else if pageType.wrappedValue == .emoji && hasEmojis{
                                    SectionedGridView(
                                        data: emojis,
                                        columns: columns,
                                        spacing: currentSize * 0.3
                                    ) { emoji in
#if os(watchOS) || os(tvOS)
                                        EmojiCell(emoji: emoji, size: currentSize, columns: columns, onShowSkins: { emojiForSkinPicker = $0 })
#else
                                        EmojiCell(emoji: emoji, size: currentSize, columns: columns)
#endif
                                    }
                                }
                                
                            }
                            .padding(.horizontal, horizontalPadding)
                            .padding(.vertical, verticalPadding)
                        #if os(tvOS)
                            .if { content in
                                if #available(tvOS 17.0, *) {
                                    content.scrollClipDisabled()
                                } else {
                                    content
                                }
                            }
                            #endif
                        }
                        
                        .onChange(of: pageType.wrappedValue) { newValue in
                            withAnimation {
                                proxy.scrollTo(newValue, anchor: .top)
                            }
                        }
                        .onAppear {
                            proxy.scrollTo(pageType.wrappedValue, anchor: .top)
                        }
                    }
                }
            }
        }
        .task(id: searchText.wrappedValue) { await performSearch() }
        .task(id: pageType.wrappedValue) { await loadData() }
        #if os(watchOS) || os(tvOS)
        .sheet(item: $emojiForSkinPicker) { emoji in
            SkinSelectionView(selection: selection, emoji: emoji, size: currentSize, columns: columns)
        }
        #endif
        #if os(tvOS)
        .if { content in
            if #available(tvOS 26.0, *) {
                content.frame(width: 800, height: 900)
            } else {
                content
            }
        }
        #endif
    }
    
    
    public func updateTopView(@ViewBuilder view: () -> some View) -> Self{
        var copy = self
        copy.topView = AnyView(view())
        return copy
    }
    
    // MARK: - Image Manipulation Helpers
    
    private func imageZoomBinding() -> Binding<Double> {
        Binding {
            selection.wrappedValue.getImage()?.zoom ?? 1.0
        } set: { newValue in
            if var updatedImage = selection.wrappedValue.getImage() {
                updatedImage.zoom = newValue
                selection.wrappedValue.setImage(updatedImage)
            }
        }
    }
    
    private func imageOffsetXBinding() -> Binding<Double> {
        Binding {
            selection.wrappedValue.getImage()?.offsetX ?? 0.0
        } set: { newValue in
            if var updatedImage = selection.wrappedValue.getImage() {
                updatedImage.offsetX = newValue
                selection.wrappedValue.setImage(updatedImage)
            }
        }
    }
    
    private func imageOffsetYBinding() -> Binding<Double> {
        Binding {
            selection.wrappedValue.getImage()?.offsetY ?? 0.0
        } set: { newValue in
            if var updatedImage = selection.wrappedValue.getImage() {
                updatedImage.offsetY = newValue
                selection.wrappedValue.setImage(updatedImage)
            }
        }
    }
    
    // MARK: - Logic
    
    private func performSearch() async {
        do {
            async let searchedSymbolsData = dataManager.search(SPSymbol.self, for: searchText.wrappedValue)
            async let searchedEmojisData = dataManager.search(SPEmoji.self, for: searchText.wrappedValue)
            let (searchedSymbols, searchedEmojis) = try await (searchedSymbolsData, searchedEmojisData)
            self.symbols = searchedSymbols
            self.emojis = searchedEmojis
        } catch {
            print("Search failed: \(error)")
        }
    }
    
    private func loadData() async {
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

fileprivate struct EmptyStateView: View {
    var body: some View {
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
            ScrollView{
                ContentUnavailableView.search
            }
        } else {
            ScrollView {
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
                Text(SPTranslation.NoResultsFound.localizedDescription)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// MARK: - Cells

fileprivate struct SymbolCell: View {
    @Environment(\.spSelection) private var selection
    @FocusState private var isFocused: Bool
    let symbol: SPSymbol
    let size: CGFloat
    
    var body: some View {
        Button {
            var updatedSelection = selection.wrappedValue
            updatedSelection.setSymbol(symbol)
            selection.wrappedValue = updatedSelection
        } label: {
            SPSymbolView(symbol: symbol)
        }
        .focused($isFocused)
        .buttonStyle(SPOptionListButtonStyle(isSelected: selection.wrappedValue.getSymbol() == symbol, isFocused: isFocused, size: size))
        .accessibilityElement()
        .accessibilityLabel(symbol.annotation ?? SPPageType.symbol.localizedDescription)
        .accessibilityAddTraits(.isButton)
    }
}

fileprivate struct EmojiCell: View {
    @Environment(\.spSelection) private var selection
    @FocusState private var isFocused: Bool
    let emoji: SPEmoji
    let size: CGFloat
    let columns: [GridItem]
    #if os(watchOS) || os(tvOS)
    let onShowSkins: (SPEmoji) -> Void
    #endif
    
    @State private var showSkinPicker = false
    
    private var isSelected: Bool {
        guard let selectedEmoji = selection.wrappedValue.getEmoji() else { return false }
        return selectedEmoji.id == emoji.id
    }
    
    var body: some View {
        Button {
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
        } label: {
            if isSelected, let selectedEmoji = selection.wrappedValue.getEmoji() {
                SPEmojiView(emoji: selectedEmoji)
            } else {
                SPEmojiView(emoji: emoji)
            }
        }
        .focused($isFocused)
        .buttonStyle(SPOptionListButtonStyle(isSelected: isSelected, isFocused: isFocused, size: size))
        .accessibilityElement()
        .accessibilityLabel(emoji.annotation ?? SPPageType.emoji.localizedDescription)
        .accessibilityAddTraits(.isButton)
        #if !os(watchOS) && !os(tvOS)
        .spPopover(isPresented: $showSkinPicker, arrowEdge: .bottom) {
            SkinSelectionView(selection: selection, emoji: emoji, size: size, columns: columns)
        }
        #endif
    }
}

// MARK: - Skin Selection

fileprivate struct SkinSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selection: SPSelection
    #if os(tvOS)
    @FocusState private var focusedIndex: Int?
    #endif
    let emoji: SPEmoji
    let size: CGFloat
    let columns: [GridItem]
    
    private var selectedEmoji: SPEmoji? {
        selection.getEmoji()
    }
    
    private var isThisEmojiSelected: Bool {
        selectedEmoji?.id == emoji.id
    }
    
    private var availableSkins: [SPEmoji.Skin] {
        emoji.skins?.filter { $0.isAvailable() } ?? []
    }
    
    var body: some View {
        #if os(watchOS) || os(tvOS)
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), alignment: .center, spacing: size * 0.3) {
                #if os(watchOS)
                content(watchSize: size * 1.2)
                #else
                content()
                #endif
            }
            .padding(.horizontal, {
                #if os(tvOS)
                if #available(tvOS 26.0, *) {
                    return 20
                } else {
                    return 80
                }
                #else
                return 20
                #endif
            }())
            .padding(.vertical, {
                #if os(tvOS)
                if #available(tvOS 26.0, *) {
                    return 20
                } else {
                    return 80
                }
                #else
                return 20
                #endif
            }())
        }
        #if os(tvOS)
        .if { content in
            if #available(tvOS 26.0, *) {
                content.frame(minWidth: 600, maxHeight: 500)
            } else {
                content
            }
        }
        #endif
        #else
        Group {
            #if os(iOS)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: size * 0.3) {
                    content()
                }
                .padding()
            }
            .frame(width: min(size * 10, UIScreen.main.bounds.width * 0.8))
            #else
            VStack(spacing: 0) {
                LazyVGrid(columns: columns, alignment: .center, spacing: size * 0.3) {
                    content()
                }
                .padding()
            }
            .frame(idealWidth: size * 11)
            #if os(macOS) || os(visionOS)
            .frame(width: size * 12)
            #endif
            #endif
        }
        #endif
    }

    @ViewBuilder
    private func content(watchSize: CGFloat? = nil) -> some View {
        let displaySize = watchSize ?? size
        // Default variant (tone 0)
        Button {
            var baseEmoji = emoji
            baseEmoji.tone = 0
            var updatedSelection = selection
            updatedSelection.setEmoji(baseEmoji)
            selection = updatedSelection
            #if os(watchOS) || os(tvOS)
            dismiss()
            #endif
        } label: {
            SPEmojiView(emoji: emojiWithTone(0))
        }
        #if os(tvOS)
        .focused($focusedIndex, equals: 0)
        #endif
        .buttonStyle(SPOptionListButtonStyle(
            isSelected: isThisEmojiSelected && (selectedEmoji?.tone ?? 0) == 0,
            isFocused: {
                #if os(tvOS)
                return focusedIndex == 0
                #else
                return false
                #endif
            }(),
            size: displaySize
        ))

        // Skin variants
        let skins = availableSkins
        if !skins.isEmpty {
            ForEach(skins.indices, id: \.self) { index in
                Button {
                    var updatedSelection = selection
                    updatedSelection.setEmoji(emojiWithTone(index + 1))
                    selection = updatedSelection
                    #if os(watchOS) || os(tvOS)
                    dismiss()
                    #endif
                } label: {
                    SPEmojiSkinView(skin: skins[index])
                }
                #if os(tvOS)
                .focused($focusedIndex, equals: index + 1)
                #endif
                .buttonStyle(SPOptionListButtonStyle(
                    isSelected: isThisEmojiSelected && selectedEmoji?.tone == index + 1,
                    isFocused: {
                        #if os(tvOS)
                        return focusedIndex == index + 1
                        #else
                        return false
                        #endif
                    }(),
                    size: displaySize
                ))
            }
        }
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
