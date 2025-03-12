//
//  SymbolModifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

private struct ExampleUsage3: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var isPickerPresented: Bool = false

    var body: some View {
        VStack {
            Button("Select Symbol") {
                isPickerPresented.toggle()
            }
            .symbolPicker(isPresented: $isPickerPresented, symbolName: $selectedSymbol, dismissOnSymbolChange: true)
            
            Image(systemName: selectedSymbol)
                .font(.system(size: 24))
                .padding()
        }
    }
}

#Preview {
    ExampleUsage3()
        .frame(width: 200, height: 200)
}
