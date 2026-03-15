//
//  SPDismissButton.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 13/03/2026.
//

import SwiftUI

struct SPDismissButton: View {
    @Environment(\.spIsPresented) var spIsPresented
    var body: some View {
        #if os(iOS)
        if #available(iOS 26.0, *){
            Button(SPTranslation.Close.localizedDescription, systemImage: "xmark"){
                spIsPresented?.wrappedValue = false
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
        }else if #available(iOS 17.0, *){
            Button{
                spIsPresented?.wrappedValue = false
            }label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .tint(.primary)
                    .symbolRenderingMode(.hierarchical)
            }
            .accessibilityLabel(SPTranslation.Close.localizedDescription)
        }else{
            Button(SPTranslation.Close.localizedDescription){
                spIsPresented?.wrappedValue = false
            }
        }
        #else
        Button(SPTranslation.Close.localizedDescription){
            spIsPresented?.wrappedValue = false
        }
        #endif
    }
}
