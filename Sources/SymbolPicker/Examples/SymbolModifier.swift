//
//  SymbolModifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

private struct ExampleUsage3: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var selectedColor: SymbolColor = .red
    @State private var isPicker1Presented: Bool = false
    @State private var isPicker2Presented: Bool = false

    var body: some View {
        VStack{
            HStack {
                Button("Color Selected") {
                    isPicker1Presented.toggle()
                }
                .symbolPicker(isPresented: $isPicker1Presented, symbolName: $selectedSymbol, color: $selectedColor, dismissOnSymbolChange: true)
                
                Button("No Color Selected") {
                    isPicker2Presented.toggle()
                }
                .symbolPicker(isPresented: $isPicker2Presented, symbolName: $selectedSymbol, dismissOnSymbolChange: true)
            }
            Image(systemName: selectedSymbol)
                .font(.system(size: 24))
                .padding()
        }
    }
}

#Preview {
    ExampleUsage3()
        .frame(width: 300, height: 200)
}
