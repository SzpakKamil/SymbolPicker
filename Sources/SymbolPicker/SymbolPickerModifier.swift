//
//  SymbolModifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

public struct SymbolPickerModifier: ViewModifier {
    @Binding public var isPresented: Bool
    @Binding public var symbolName: String
    @Binding public var colorValue: Color
    public func body(content: Content) -> some View {
        content
            .popover(isPresented: $isPresented){
                SymbolPicker(symbolName: $symbolName, color: $colorValue)
            }
    }
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, colorValues: Binding<[Double]>){
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = Binding(get: {
            Color(red: colorValues.wrappedValue[0], green: colorValues.wrappedValue[1], blue: colorValues.wrappedValue[2])
        }, set: { newValue in
            #if canImport(UIKit)
            // Use UIColor on iOS and tvOS
            typealias NativeColor = UIColor
            #elseif canImport(AppKit)
            // Use NSColor on macOS
            typealias NativeColor = NSColor
            #endif
            
            // Variables to store the individual color components
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var o: CGFloat = 1
            
            #if !os(macOS)
            // For iOS and tvOS, safely extract the color components
            guard NativeColor(newValue).getRed(&r, green: &g, blue: &b, alpha: &o) else {
                // Return default black color with full opacity if conversion fails
                colorValues = [0,0,0,1]
                return
            }
            #else
            // On macOS, convert the color to the sRGB color space and extract the RGB components; getRed(_:green:blue:alpha:) returns Void, so no guard               needed
            NativeColor(newValue).usingColorSpace(.sRGB)?.getRed(&r, green: &g, blue: &b, alpha: &o)
            #endif
            colorValues.wrappedValue = [r,g,b,o]
        })
        
    }
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>){
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = color
    }
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, symbolColor: Binding<SymbolColor>){
        self._isPresented = isPresented
        self._symbolName = symbolName
        self._colorValue = .init(get: {
            symbolColor.wrappedValue.color
        }, set: { newValue in
            if let color = SymbolColor.allCases.first(where: { $0.color == newValue}){
                symbolColor.wrappedValue = color
            }
            
        })
    }
}

public extension View {
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, colorValues: Binding<[Double]>) -> some View {
        modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, colorValues: colorValues))
    }
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>) -> some View {
        modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, color: color))
    }
    func symbolPicker(isPresented: Binding<Bool>, symbolName: Binding<String>, symbolColor: Binding<SymbolColor>) -> some View {
        modifier(SymbolPickerModifier(isPresented: isPresented, symbolName: symbolName, symbolColor: symbolColor))
    }
}
