//
//  SymbolModifierColorFilledNotFilled.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

private struct SymbolModifierColorFilledNotFilled: View {
    @State private var selectedSymbol: String = "car"
    @State private var selectedColor: SymbolColor = .red
    @State private var isPicker1Presented: Bool = false
    @State private var isPicker2Presented: Bool = false

    var body: some View {
        VStack{
            HStack {
                Text(selectedSymbol)
                Button("Filled") {
                    isPicker1Presented.toggle()
                }
                .symbolPicker(isPresented: $isPicker1Presented, symbolName: $selectedSymbol, color: $selectedColor, dismissOnSymbolChange: true)
                
                Button("Not filled") {
                    isPicker2Presented.toggle()
                }
                .symbolPicker(isPresented: $isPicker2Presented, symbolName: $selectedSymbol, color: $selectedColor, dismissOnSymbolChange: false, useFilledSymbols: false)
            }
            Image(systemName: selectedSymbol)
                .font(.system(size: 24))
                .padding()
        }
    }
}

#Preview {
    SymbolModifierColorFilledNotFilled()
        .frame(width: 300, height: 200)
}
