//
//  SPColor-Standard.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPColor {
    // MARK: - Standard Presets
    
    struct StandardColorMetadata: Sendable {
        let native: NativeColor
        let localizedKey: String
        let fallbackName: String
        let components: RGBA
        
        init(native: NativeColor, localizedKey: String, fallbackName: String) {
            self.native = native
            self.localizedKey = localizedKey
            self.fallbackName = fallbackName
            self.components = SPColor.extractRGBA(from: native)
        }
    }

    static let registry: [String: StandardColorMetadata] = [
        "red":    .init(native: .systemRed,    localizedKey: "SymbolPickerColors.Red",    fallbackName: "Red"),
        "orange": .init(native: .systemOrange, localizedKey: "SymbolPickerColors.Orange", fallbackName: "Orange"),
        "yellow": .init(native: .systemYellow, localizedKey: "SymbolPickerColors.Yellow", fallbackName: "Yellow"),
        "green":  .init(native: .systemGreen,  localizedKey: "SymbolPickerColors.Green",  fallbackName: "Green"),
        "mint":   .init(native: .systemMint,   localizedKey: "SymbolPickerColors.Mint",   fallbackName: "Mint"),
        "teal":   .init(native: .systemTeal,   localizedKey: "SymbolPickerColors.Teal",   fallbackName: "Teal"),
        "cyan":   .init(native: .systemCyan,   localizedKey: "SymbolPickerColors.Cyan",   fallbackName: "Cyan"),
        "blue":   .init(native: .systemBlue,   localizedKey: "SymbolPickerColors.Blue",   fallbackName: "Blue"),
        "indigo": .init(native: .systemIndigo, localizedKey: "SymbolPickerColors.Indigo", fallbackName: "Indigo"),
        "purple": .init(native: .systemPurple, localizedKey: "SymbolPickerColors.Purple", fallbackName: "Purple"),
        "pink":   .init(native: .systemPink,   localizedKey: "SymbolPickerColors.Pink",   fallbackName: "Pink"),
        "brown":  .init(native: .systemBrown,  localizedKey: "SymbolPickerColors.Brown",  fallbackName: "Brown"),
        "gray":   .init(native: .systemGray,   localizedKey: "SymbolPickerColors.Gray",   fallbackName: "Gray"),
        "white":  .init(native: .white,        localizedKey: "SymbolPickerColors.White",  fallbackName: "White"),
        "black":  .init(native: .black,        localizedKey: "SymbolPickerColors.Black",  fallbackName: "Black")
    ]
    
    private static func extractRGBA(from color: NativeColor) -> RGBA {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        
        #if canImport(UIKit)
        let targetSpace = CGColorSpace(name: CGColorSpace.sRGB)!
        if let converted = color.cgColor.converted(to: targetSpace, intent: .defaultIntent, options: nil),
           let comps = converted.components, comps.count >= 3 {
            r = comps[0]; g = comps[1]; b = comps[2]; a = converted.alpha
        }
        #else
        if let converted = color.usingColorSpace(.sRGB) {
            converted.getRed(&r, green: &g, blue: &b, alpha: &a)
        }
        #endif
        
        return RGBA(r: Double(r), g: Double(g), b: Double(b), a: Double(a))
    }
    
    static func isStandardName(_ name: String) -> Bool {
        return registry[name.lowercased()] != nil
    }
    
    public static let red      = SPColor(id: "red")!
    public static let orange   = SPColor(id: "orange")!
    public static let yellow   = SPColor(id: "yellow")!
    public static let green    = SPColor(id: "green")!
    public static let mint     = SPColor(id: "mint")!
    public static let teal     = SPColor(id: "teal")!
    public static let cyan     = SPColor(id: "cyan")!
    public static let blue     = SPColor(id: "blue")!
    public static let indigo   = SPColor(id: "indigo")!
    public static let purple   = SPColor(id: "purple")!
    public static let pink     = SPColor(id: "pink")!
    public static let brown    = SPColor(id: "brown")!
    public static let gray     = SPColor(id: "gray")!
    public static let white    = SPColor(id: "white")!
    public static let black    = SPColor(id: "black")!
    
    public static let standardColors: [SPColor] = [
        .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue,
        .indigo, .purple, .pink, .brown, .gray, .white, .black
    ]
}
