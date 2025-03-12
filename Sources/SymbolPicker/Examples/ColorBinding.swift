//
//  ColorBinding.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

private struct ExampleUsage2: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var color = Color.red
    @State private var isPickerPresented: Bool = false

    var body: some View {
        VStack {
            Button("Select Symbol") {
                isPickerPresented.toggle()
            }
            .popover(isPresented: $isPickerPresented) {
                if #available(macOS 12.0, *) {
                    SymbolPicker(symbolName: $selectedSymbol, colorOption: .color($color))
                } else {
                    SymbolPickerOld(isPresented: $isPickerPresented, symbolName: $selectedSymbol, colorOption: .color($color))
                }
            }
            
            Image(systemName: selectedSymbol)
                .spForegroundStyle(color)
                .font(.system(size: 24))
                .padding()
        }
    }
}

#Preview {
    ExampleUsage2()
        .frame(width: 200, height: 200)
}
