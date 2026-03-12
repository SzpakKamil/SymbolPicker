//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPOptionListSectionGrid<T: SPDataAsset, Content: View>: View {
    let data: [SPCategory<T>]
    let columns: [GridItem]
    let spacing: CGFloat
    let content: (T) -> Content
    
    var body: some View {
        LazyVStack{
            ForEach(data, id: \.category) { section in
                SPHeaderView(title: section.category)
                LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                    ForEach(section.elements) { item in
                        content(item)
                            .id(item)
                    }
                }
            }
        }
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


