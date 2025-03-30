//
//  SymbolPickerData.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 30/03/2025.
//

import SwiftUI

public struct SymbolPickerData{
    public var isPresented: Binding<Bool>
    public var symbolName: Binding<String>
    public var colorValue: Binding<Color>?
    public var dismissOnSymbolChange: Bool
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<Color>?, dismissOnSymbolChange: Bool = false) {
        self.symbolName = symbolName
        self.dismissOnSymbolChange = dismissOnSymbolChange
        self.isPresented = isPresented
        // Set the colorValue based on the colorOption type
        if let color {
            self.colorValue = color
        } else {
            self.colorValue = .constant(.clear)
        }
    }
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<SymbolColor>?, dismissOnSymbolChange: Bool = false) {
        self.symbolName = symbolName
        self.isPresented = isPresented
        self.dismissOnSymbolChange = dismissOnSymbolChange
        
        // Set the colorValue based on the colorOption type
        if let color {
            self.colorValue = .init(get: {
                color.wrappedValue.color
            }, set: { newValue in
                if let newColor = SymbolColor.allCases.first(where: { $0.color == newValue }) {
                    color.wrappedValue = newColor
                }
            })
        } else {
            self.colorValue = .constant(.clear)
        }
    }
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, color: Binding<[Double]>?, dismissOnSymbolChange: Bool = false) {
        self.symbolName = symbolName
        self.dismissOnSymbolChange = dismissOnSymbolChange
        self.isPresented = isPresented
        // Set the colorValue based on the colorOption type
        if let colorOption = color {
                self.colorValue = Binding(get: {
                    Color(red: colorOption.wrappedValue[0], green: colorOption.wrappedValue[1], blue: colorOption.wrappedValue[2])
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
                        colorValues.wrappedValue = [0, 0, 0, 1]
                        return
                    }
                    #else
                    // On macOS, convert the color to the sRGB color space and extract the RGB components
                    NativeColor(newValue).usingColorSpace(.sRGB)?.getRed(&r, green: &g, blue: &b, alpha: &o)
                    #endif
                    colorOption.wrappedValue = [r, g, b, o]
                })
        } else {
            self.colorValue = .constant(.clear)
        }
    }
    
    public init(isPresented: Binding<Bool>, symbolName: Binding<String>, dismissOnSymbolChange: Bool = false) {
        self.symbolName = symbolName
        self.dismissOnSymbolChange = dismissOnSymbolChange
        self.isPresented = isPresented
        self.colorValue = .constant(.clear)
    }
}
