//
//  SymbolModifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

struct SymbolPickerModifier: ViewModifier {
    var pickerData: SymbolPickerData
    @ViewBuilder func body(content: Content) -> some View {
        content
            .popover(isPresented: pickerData.isPresented){
                if #available(macOS 12.0, *) {
                    SymbolPicker(for: pickerData)
                } else {
                    SymbolPickerOld(for: pickerData)
                }
            }
    }
    
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange)
    }
    
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange)
    }
    
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange)
    }

    init(isPresented: Binding<Bool>, symbolName: Binding<String>, dismissOnSymbolChange: Bool = false) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange)
    }
}

public extension View {
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false) -> some View {
        if let color{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange))
        }else{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange))
        }
    }
    
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false) -> some View {
        if let color{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange))
        }else{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange))
        }
    }
    
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false) -> some View {
        if let color{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange))
        }else{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange))
        }
    }
    
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, dismissOnSymbolChange: Bool = false) -> some View {
        modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange))
    }
}
