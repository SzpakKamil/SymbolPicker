//
//  SymbolModifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

public struct SymbolPickerModifier: ViewModifier {
    var pickerData: SymbolPickerData
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }

    @ViewBuilder public func body(content: Content) -> some View {
        #if os(macOS)
        content
            .popover(isPresented: pickerData.isPresented){
                SymbolPicker(for: pickerData)
            }
        #else
        if usePopover{
            content
                .popover(isPresented: pickerData.isPresented){
                    SymbolPicker(for: pickerData)
                }
        }else{
            content
                .sheet(isPresented: pickerData.isPresented){
                    SymbolPicker(for: pickerData)
                }
        }
        #endif
    }
    
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }

    init(isPresented: Binding<Bool>, symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
}

public extension View {
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) -> some View {
        if let color{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols))
        }else{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols))
        }
    }
    
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) -> some View {
        if let color{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols))
        }else{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols))
        }
    }
    
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) -> some View {
        if let color{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols))
        }else{
            modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols))
        }
    }
    
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) -> some View {
        modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols))
    }
}
