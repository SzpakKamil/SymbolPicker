//
//  TypeCreateView.swift
//  Checker
//
//  Created by Kamil Szpak on 29/06/2025.
//

import SwiftUI

struct TypeCreateView: View {
    @State private var type = Type()
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
