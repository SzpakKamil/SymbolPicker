//
//  SPPopoverWrapper.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 18/02/2026.
//

import SwiftUI
import SearchBar

struct SPSearchBar: View {
    @Environment(\.spSearchText) var spSearchText
    @Environment(\.spPageType) var spPageType
    var body: some View {
        if [SPPageType.emoji, .symbol].contains(spPageType.wrappedValue){
            SearchBar(text: spSearchText)
                #if os(macOS)
                .searchBarStyle(.rounded)
                #elseif os(iOS)
                .if{ content in
                    if #available(iOS 26.0, *){
                        content
                            .searchBarStyle(.capsule, backgroundColor: Color.primary.opacity(0.05))
                    }else{
                        content
                            .searchBarStyle(.rounded, backgroundColor: Color.primary.opacity(0.05))
                    }
                }
                .padding(.horizontal, -14)
                .padding(.top, -8)
                .padding(.vertical, -8)
                #else
                .searchBarStyle(.capsule)
                #endif
                #if !os(visionOS) && !os(iOS)
                .if{ content in
                    if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *){
                        content
                            .searchBarMaterial(.glass)
                    }else{
                        content
                    }
                }
                #elseif !os(iOS)
                .padding(.vertical, -18)
                .padding(.horizontal, -25)
                #endif
        }
    }
}
