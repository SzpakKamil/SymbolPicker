//
//  SPColor-Init.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//
import SwiftUI

extension SPColor {
    // MARK: - Initializers
    
    public init?(id: String, darkId: String? = nil, highContrastId: String? = nil, colorSpace: SPColorSpace = .sRGB) {
        guard let instance = SPColor(stringId: id, darkStringId: darkId, highContrastStringId: highContrastId, colorSpace: colorSpace) else {
            return nil
        }
        self = instance
    }
    
    public init(red: Double, green: Double, blue: Double, opacity: Double = 1, colorSpace: SPColorSpace = .sRGB) {
        let f = { (v: Double) in Int((min(max(v, 0), 1) * 255)) }
        let hex = String(format: "#%02x%02x%02x%02x", f(red), f(green), f(blue), f(opacity))
        let rgba = RGBA(r: red, g: green, b: blue, a: opacity)
        
        self.init(primary: .custom(hex: hex, rgba: rgba), dark: nil, highContrast: nil, colorSpace: colorSpace)
    }
    
    @MainActor
    public init(nativeColor: NativeColor) {
        // 1. Check Standard Colors FIRST to avoid P3 conversion drift
        if let match = SPColor.standardColors.first(where: { $0.nativeColor == nativeColor }) {
            self = match
            return
        }
        
        // 2. Detect appropriate color space
        let targetSpace: SPColorSpace
        
        #if canImport(UIKit)
        if let cgSpace = nativeColor.cgColor.colorSpace, cgSpace.name == CGColorSpace.displayP3 {
            targetSpace = .displayP3
        } else {
            targetSpace = .sRGB
        }
        #elseif canImport(AppKit)
        if let cgSpace = nativeColor.cgColor.colorSpace, cgSpace.name == CGColorSpace.displayP3 {
            targetSpace = .displayP3
        } else {
            targetSpace = .sRGB
        }
        #endif
        
        #if canImport(UIKit)
        let lightHex = nativeColor.resolvedColor(with: .init(userInterfaceStyle: .light)).toHex8(in: targetSpace) ?? "#000000ff"
        let darkHex = nativeColor.resolvedColor(with: .init(userInterfaceStyle: .dark)).toHex8(in: targetSpace) ?? "#000000ff"
        let hcHex = nativeColor.resolvedColor(with: .init(accessibilityContrast: .high)).toHex8(in: targetSpace) ?? "#000000ff"
        #elseif canImport(AppKit)
        var lHex: String = nativeColor.toHex8(in: targetSpace) ?? "#000000ff"
        var dHex: String = lHex
        var hHex: String = lHex
        
        NSAppearance(named: .aqua)?.performAsCurrentDrawingAppearance {
            lHex = nativeColor.toHex8(in: targetSpace) ?? "#000000ff"
        }
        NSAppearance(named: .darkAqua)?.performAsCurrentDrawingAppearance {
            dHex = nativeColor.toHex8(in: targetSpace) ?? "#000000ff"
        }
        NSAppearance(named: .accessibilityHighContrastAqua)?.performAsCurrentDrawingAppearance {
            hHex = nativeColor.toHex8(in: targetSpace) ?? "#000000ff"
        }
        
        let lightHex = lHex
        let darkHex = dHex
        let hcHex = hHex
        #endif
        
        // Helper to generate definition directly since we just generated the hex
        let makeDef: (String) -> ColorDefinition = { hex in
            if let existing = SPColor.parseHex(hex) {
                 return .custom(hex: hex, rgba: existing)
            }
            return .custom(hex: hex, rgba: RGBA(r: 0, g: 0, b: 0, a: 1))
        }
        
        let primary = makeDef(lightHex)
        let dark = (darkHex != lightHex) ? makeDef(darkHex) : nil
        let hc = (hcHex != lightHex) ? makeDef(hcHex) : nil
        
        self.init(primary: primary, dark: dark, highContrast: hc, colorSpace: targetSpace)
    }
}

