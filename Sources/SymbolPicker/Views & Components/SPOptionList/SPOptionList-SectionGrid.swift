//
//  SPOptionList-SectionGrid.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

struct SPOptionListSectionGrid<DataAsset: SPDataAsset, Content: View>: View {
    let data: [SPCategory<DataAsset>]
    let columns: [GridItem]
    let spacing: CGFloat
    let content: (DataAsset) -> Content
    
    var body: some View {
        #if os(macOS)
        LazyVStack{
            ForEach(data, id: \.category) { section in
                SPHeaderView(title: section.category)
                LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                    ForEach(section.elements) { item in
                        content(item)
                    }
                }
            }
        }
        #else
        LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
            ForEach(data, id: \.category) { section in
                Section(header: SPHeaderView(title: section.category)) {
                    ForEach(section.elements) { item in
                        content(item)
                    }
                }
            }
        }
        #endif
    }
}

struct SPHeaderView: View {
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
