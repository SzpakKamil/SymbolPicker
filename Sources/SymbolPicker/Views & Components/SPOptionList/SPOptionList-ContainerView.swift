//
//  SPOptionList-ContainerView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

struct SPOptionListContainerView<DataAsset: SPDataAsset, PhotoView: View, SymbolView: View, EmojiView: View>: View {
    @Environment(\.spSearchText) var searchText
    @Environment(\.spPageType) var pageType
    @Environment(\.symbolPickerStyle) var style
    @State private var symbols: [SPCategory<DataAsset>] = []
    @State private var emojis: [SPCategory<SPEmoji>] = []
    
    let photoView: () -> PhotoView
    let symbolView: ([SPCategory<DataAsset>]) -> SymbolView
    let emojiView: ([SPCategory<SPEmoji>]) -> EmojiView
    private let dataManager = SPDataManager()
    
    var body: some View {
        SPOptionListScrollView(showProgress: searchText.wrappedValue.isEmpty && symbols.isEmpty && emojis.isEmpty){ proxy in
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
                #if os(iOS)
                .padding(.vertical, 30)
                #elseif os(macOS)
                    .padding(.top, 40)
                #endif
        }
        .task(id: searchText.wrappedValue, priority: .high) { await performSearch() }
        .task(id: pageType.wrappedValue, priority: .high) { await loadData() }
    }
    
    private func performSearch() async {
        let types = style.supportedTypes
        let defaultType = style.defaultType
        
        do {
            async let searchedSymbols = types.contains(.symbol) || defaultType == .symbol
                ? try await dataManager.search(DataAsset.self, for: searchText.wrappedValue)
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
                ? try await dataManager.fetch(type: DataAsset.self)
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
    
    init(@ViewBuilder photoView: @escaping () -> PhotoView, @ViewBuilder symbolView: @escaping ([SPCategory<DataAsset>]) -> SymbolView, @ViewBuilder emojiView: @escaping ([SPCategory<SPEmoji>]) -> EmojiView) {
        self.photoView = photoView
        self.symbolView = symbolView
        self.emojiView = emojiView
    }

}
