//
//  SymbolModifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

struct SymbolPickerModifier: ViewModifier {
    @Binding var isPresented: Bool
    @Binding var symbolName: String
    var dismissOnSymbolChange: Bool = false
    var colorOption: ColorOption?

    init(isPresented: Binding<Bool>, symbolName: Binding<String>, colorOption: ColorOption?, dismissOnSymbolChange: Bool = false) {
        self._isPresented = isPresented
        self._symbolName = symbolName
        self.colorOption = colorOption
        self.dismissOnSymbolChange = dismissOnSymbolChange
    }

    @ViewBuilder func body(content: Content) -> some View {
        content
            .popover(isPresented: $isPresented){
                if #available(macOS 12.0, *) {
                    SymbolPicker(symbolName: $symbolName, colorOption: colorOption, dismissOnSymbolChange: dismissOnSymbolChange)
                } else {
                    SymbolPickerOld(isPresented: $isPresented, symbolName: $symbolName, colorOption: colorOption, dismissOnSymbolChange: dismissOnSymbolChange)
                }
            }
    }
}

public enum ColorOption {
    case colorValues(Binding<[Double]>)
    case color(Binding<Color>)
    case symbolColor(Binding<SymbolColor>)
}

public extension View {
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, colorOption: ColorOption? = nil, dismissOnSymbolChange: Bool = false) -> some View {
        modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, colorOption: colorOption, dismissOnSymbolChange: dismissOnSymbolChange))
    }
}
