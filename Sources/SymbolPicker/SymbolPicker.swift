//
//  SymbolPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 31/03/2025.
//

import SwiftUI

public struct SymbolPicker: View{
    var pickerData: SymbolPickerData
    
    public var body: some View{
        if #available(macOS 12.0, iOS 15.0, visionOS 1.0, *) {
            SymbolPickerNew(for: pickerData)
        } else {
            SymbolPickerOld(for: pickerData)
        }
    }
    
    public init(for data: SymbolPickerData) {
        self.pickerData = data
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented:.constant(false), symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented:.constant(false), symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented:.constant(false), symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 12.0, iOS 15.0, visionOS 1.0, *)
    public init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented:.constant(false), symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, color: color, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
    
    @available(macOS 11.0, iOS 14.0, visionOS 1.0, *)
    @available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(iOS, deprecated: 15.0, message: "Use the newer initializer available in iOS 15.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    @available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ init(symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true)")
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, dismissOnSymbolChange: Bool = false, useFilledSymbols: Bool = true) {
        self.pickerData = .init(isPresented: isPresented, symbolName: symbolName, dismissOnSymbolChange: dismissOnSymbolChange, useFilledSymbols: useFilledSymbols)
    }
}
