//
//  SymbolColorBinding.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

private struct ExampleUsage3: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var symbolColor = SymbolColor.red
    @State private var isPickerPresented: Bool = false

    var body: some View {
        VStack {
            Button("Select Symbol") {
                isPickerPresented.toggle()
            }
            .popover(isPresented: $isPickerPresented) {
                SymbolPicker(symbolName: $selectedSymbol, symbolColor: $symbolColor)
            }
            
            Image(systemName: selectedSymbol)
                .spForegroundStyle(symbolColor.color)
                .font(.system(size: 24))
                .padding()
        }
    }
}

#Preview {
    ExampleUsage3()
        .frame(width: 200, height: 200)
}
