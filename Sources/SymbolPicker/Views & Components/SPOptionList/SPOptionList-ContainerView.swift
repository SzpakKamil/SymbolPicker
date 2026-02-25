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
    @Environment(\.symbolPickerStyle) var style
    @State private var symbols: [SPCategory<SPSymbol>] = []
    @State private var emojis: [SPCategory<SPEmoji>] = []
    
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
        SPOptionListScrollView(showProgress: searchText.wrappedValue.isEmpty && symbols.isEmpty && emojis.isEmpty, useScrollView: shouldScroll && hasResults){ proxy in
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
        }progressView: {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .task(id: searchText.wrappedValue, priority: .high) { await performSearch() }
        .task(id: pageType.wrappedValue, priority: .high) { await loadData() }
    }
    
    private func performSearch() async {
        let types = style.supportedTypes
        let defaultType = style.defaultType
        
        do {
            async let searchedSymbols = types.contains(.symbol) || defaultType == .symbol
                ? try await dataManager.search(SPSymbol.self, for: searchText.wrappedValue)
                : []
                
            async let searchedEmojis = types.contains(.emoji) || defaultType == .emoji
                ? try await dataManager.search(SPEmoji.self, for: searchText.wrappedValue)
                : []

            let (finalSymbols, finalEmojis) = try await (searchedSymbols, searchedEmojis)
            
            self.symbols = finalSymbols
            self.emojis = finalEmojis
        } catch {
            print("Search failed: \(error)")
        }
    }
    
    private func loadData() async {
        guard symbols.isEmpty && emojis.isEmpty else { return }
        let types = style.supportedTypes
        let defaultType = style.defaultType
        
        do {
            async let fetchedSymbols = types.contains(.symbol) || defaultType == .symbol
                ? try await dataManager.fetch(type: SPSymbol.self)
                : []
                
            async let fetchedEmojis = types.contains(.emoji) || defaultType == .emoji
                ? try await dataManager.fetch(type: SPEmoji.self)
                : []

            let (finalSymbols, finalEmojis) = try await (fetchedSymbols, fetchedEmojis)
            
            self.symbols = finalSymbols
            self.emojis = finalEmojis
        } catch {
            print("Data failed to load: \(error) ")
        }
    }
    
    init(@ViewBuilder photoView: @escaping () -> PhotoView, @ViewBuilder symbolView: @escaping ([SPCategory<SPSymbol>]) -> SymbolView, @ViewBuilder emojiView: @escaping ([SPCategory<SPEmoji>]) -> EmojiView) {
        self.photoView = photoView
        self.symbolView = symbolView
        self.emojiView = emojiView
    }

}

