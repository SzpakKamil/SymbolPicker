//
//  SPOptionListContainerView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPOptionListContainerView<PhotoView: View, SymbolView: View, EmojiView: View>: View {
    @Environment(\.spSearchText) var searchText
    @Environment(\.spPageType) var pageType
    @State private var symbols: [SPCategory<SPSymbol>] = []
    @State private var emojis: [SPCategory<SPEmoji>] = []
    let style: SPOptionList.Configuration
    let photoView: () -> PhotoView
    let symbolView: ([SPCategory<SPSymbol>]) -> SymbolView
    let emojiView: ([SPCategory<SPEmoji>]) -> EmojiView
    private let dataManager = SPDataManager()
    
    var body: some View {
        let shouldScroll = pageType.wrappedValue == .emoji || pageType.wrappedValue == .symbol
        #if os(watchOS)
        let hasResults = true
        #else
        let hasResults = pageType.wrappedValue == .emoji ? emojis.first?.elements.isEmpty == false : symbols.first?.elements.isEmpty == false
        #endif
        SPOptionListScrollView(style: style, useScrollView: shouldScroll && hasResults){ proxy in
            if searchText.wrappedValue.isEmpty && symbols.isEmpty && emojis.isEmpty{
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }else{
                switch pageType.wrappedValue{
                case .emoji:
                    if emojis.first?.elements.isEmpty == true{
                        SPOptionListEmptyState()
                    }else{
                        emojiView(emojis)
                    }
                case .symbol:
                    if symbols.first?.elements.isEmpty == true{
                        SPOptionListEmptyState()
                    }else{
                        symbolView(symbols)
                    }
                default:
                    photoView()
                }
            }
        }
        .task(id: searchText.wrappedValue) { await performSearch() }
        .task(id: pageType.wrappedValue) { await loadData() }
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
        do {
            async let symbolsData = dataManager.fetch(type: SPSymbol.self)
            async let emojisData = dataManager.fetch(type: SPEmoji.self)
            let (fetchedSymbols, fetchedEmojis) = try await (symbolsData, emojisData)
            self.symbols = fetchedSymbols
            self.emojis = fetchedEmojis
        } catch {
            print("Data failed to load: \(error)")
        }
    }
    
    
    init(style: SPOptionList.Configuration, @ViewBuilder photoView: @escaping () -> PhotoView, @ViewBuilder symbolView: @escaping ([SPCategory<SPSymbol>]) -> SymbolView, @ViewBuilder emojiView: @escaping ([SPCategory<SPEmoji>]) -> EmojiView) {
        self.style = style
        self.photoView = photoView
        self.symbolView = symbolView
        self.emojiView = emojiView
    }

}

