//
//  SPSearchBar.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import SearchBar

struct SPSearchBar: View {
    @Environment(\.spSearchText) var spSearchText
    @Environment(\.spPageType) var spPageType
    @Environment(\.symbolPickerStyle) var symbolPickerStyle
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var body: some View {
        SearchBar(
            text: spSearchText,
            prompt: spPageType.wrappedValue == .symbol ? SPTranslation.SearchSymbols.localizedDescription: spPageType.wrappedValue == .emoji ? SPTranslation.SearchEmojis.localizedDescription : nil
        )
#if os(macOS)
        .searchBarStyle(.rounded, backgroundColor: Color.primary.opacity(0.1))
#elseif os(iOS)
        .if{ content in
            if #available(iOS 26.0, *){
                content
                    .searchBarStyle(.capsule, backgroundColor: Color.primary.opacity(0.05))
            }else{
                content
                    .searchBarStyle(.rounded, backgroundColor: Color(.tertiarySystemFill))
            }
        }
        .padding(.horizontal, symbolPickerStyle.displayStyle == .compact ? (symbolPickerStyle.spacings.getValue(.horizontalPadding, for: .optionList, at: dynamicTypeSize)) * 0.8  :  -14)
        .padding(.top, symbolPickerStyle.displayStyle == .compact ? 3 : -8)
        .padding(.vertical, -8)
#elseif os(visionOS)
        .searchBarStyle(.capsule)
        .if{ content in
            if #available(visionOS 26.0, *){
                content
                    .padding(.horizontal, -25)
                    .padding(.vertical, -20)
            }else{
                content
                    .padding(.horizontal, symbolPickerStyle.displayStyle == .detail ? -25: -5)
                    .padding(.vertical, -20)
            }
        }
#elseif os(tvOS)
        .if{ content in
            if #available(tvOS 26.0, *){
                content
                    .searchBarStyle(.capsule, backgroundColor: Color.primary.opacity(0.1))
                    .searchBarMaterial(.glass)
                    .searchBarScale(.medium)
                    .padding(.vertical, symbolPickerStyle.displayStyle == .detail ? -10 : 0)
            }else{
                content
                    .searchBarStyle(.rounded, backgroundColor: Color.primary.opacity(0.05))
                    .searchBarScale(.medium)
            }
        }
#else
        .searchBarStyle(.capsule)
#endif
#if !os(visionOS) && !os(iOS) && !os(tvOS)
        .if{ content in
            if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *){
                content
                    .searchBarMaterial(.glass)
            }else{
                content
            }
        }
#endif
        .id(spPageType.wrappedValue.id)
    }
    
    func asInsetView() -> SPInsetedView {
        #if os(iOS)
        SPInsetedView(placement: .safeAreaBottom) {
            SPSearchBar()
        }
        .spPadding(.top, value: 3)
        .spBackground { Rectangle().fill(.bar).ignoresSafeArea() }
        #else
        SPInsetedView(placement: .scrollContentTop) {
            SPSearchBar()
        }
        #endif
    }
}
