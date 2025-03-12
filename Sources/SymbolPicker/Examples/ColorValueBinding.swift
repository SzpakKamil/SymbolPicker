//
//  ColorValueBinding.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

private struct ExampleUsage1: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var colorValues = [0.906, 0.392, 0.416, 1]
    @State private var isPickerPresented: Bool = false

    var body: some View {
        VStack {
            Button("Select Symbol") {
                isPickerPresented.toggle()
            }
            .popover(isPresented: $isPickerPresented) {
                if #available(macOS 12.0, *) {
                    SymbolPicker(symbolName: $selectedSymbol, colorOption: .colorValues($colorValues))
                } else {
                    SymbolPickerOld(isPresented: $isPickerPresented, symbolName: $selectedSymbol, colorOption: .colorValues($colorValues))
                }
            }
            
            Image(systemName: selectedSymbol)
                .spForegroundStyle(Color(red: colorValues[0], green: colorValues[1], blue: colorValues[2]))
                .font(.system(size: 24))
                .padding()
        }
    }
}

#Preview {
    ExampleUsage1()
        .environment(\.locale, .init(identifier: "de"))
        .frame(width: 200, height: 200)
}
