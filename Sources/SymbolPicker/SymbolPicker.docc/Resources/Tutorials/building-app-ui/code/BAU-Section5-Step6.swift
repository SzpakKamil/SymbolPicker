//
//  TypeCreateView.swift
//  Checker
//
//  Created by Kamil Szpak on 29/06/2025.
//

import SwiftUI
import SymbolPicker

struct TypeCreateView: View {
    @State private var type = Type()
    @State private var isPresentingSymbolPicker = false
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $type.title)
                Button("Select Symbol", systemImage: type.symbolName){
                    isPresentingSymbolPicker.toggle()
                }
                .buttonStyle(.plain)
                .foregroundStyle(type.symbolColor.color)
            }
            .navigationTitle("Add Type")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TypeCreateView()
}
