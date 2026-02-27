//
//  SPOptionList-EmptyState.swift.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPOptionListEmptyState: View {
    var body: some View {
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
            ContentUnavailableView.search
            #if os(tvOS)
                .ignoresSafeArea()
            #endif
        } else {
            VStack{
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
                Text(SPTranslation.NoResultsFound.localizedDescription)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            #if os(iOS)
            .padding(.vertical, 30)
            #endif
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
