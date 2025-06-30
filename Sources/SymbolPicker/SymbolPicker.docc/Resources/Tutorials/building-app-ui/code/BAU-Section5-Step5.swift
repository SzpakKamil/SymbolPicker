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
            }
            .navigationTitle("Add Type")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TypeCreateView()
}
