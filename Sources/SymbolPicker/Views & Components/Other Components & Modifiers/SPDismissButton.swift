//
//  SPDismissButton.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 13/03/2026.
//

import SwiftUI

struct SPDismissButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        #if os(iOS)
        if #available(iOS 26.0, *){
            #if compiler(>=6.2)
            Button(SPTranslation.Close.localizedDescription, systemImage: "xmark"){
                dismiss()
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
            #else
            Button{
                dismiss()
            }label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .tint(.primary)
                    .symbolRenderingMode(.hierarchical)
            }
            .accessibilityLabel(SPTranslation.Close.localizedDescription)
            #endif
        }else if #available(iOS 17.0, *){
            Button{
                dismiss()
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
                dismiss()
            }
        }
        #else
        Button(SPTranslation.Close.localizedDescription){
            dismiss()
        }
        #endif
    }
}
