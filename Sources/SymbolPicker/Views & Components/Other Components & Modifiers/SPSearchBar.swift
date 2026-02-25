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
    @Environment(\.spDisplaySize) var spDisplaySize
    var body: some View {
        SearchBar(text: spSearchText)
            #if os(macOS)
            .searchBarStyle(.rounded)
            #elseif os(iOS)
            .searchBarScale(.medium)
            .searchBarStyle(.capsule, backgroundColor: .primary.opacity(0.05))
            #else
            .searchBarStyle(.capsule)
            #endif
            #if !os(visionOS)
            .if{ content in
                if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *){
                    #if os(iOS)
                    content.searchBarMaterial(.glass)
                    #else
                    content.searchBarMaterial(.glass)
                    #endif

                }else{
                    content
                }
            }
            #else
            .padding(.vertical, -18)
            .padding(.horizontal, -25)
            #endif
    }
}
