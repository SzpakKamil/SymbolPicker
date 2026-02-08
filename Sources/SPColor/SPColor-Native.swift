//
//  SPColor-Native.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPColor {
    // MARK: - Computed Properties
    
    public var color: Color { Color(nativeColor) }
    
    public var nativeColor: NativeColor {
        #if canImport(UIKit)
        return UIColor { traitCollection in
            let isDark = traitCollection.userInterfaceStyle == .dark
            let isHighContrast = traitCollection.accessibilityContrast == .high
            
            if isHighContrast, let hc = highContrastId {
                return resolveNative(from: hc, components: highContrastComponents, space: colorSpace)
            }
            if isDark, let dark = darkId {
                return resolveNative(from: dark, components: darkComponents, space: colorSpace)
            }
            return resolveNative(from: id, components: components, space: colorSpace)
        }
        #elseif canImport(AppKit)
        return NSColor(name: nil) { appearance in
            let isDark = appearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
            let name = appearance.name
            let isHighContrast = name == .accessibilityHighContrastAqua || name == .accessibilityHighContrastDarkAqua ||
                                 name == .accessibilityHighContrastVibrantLight || name == .accessibilityHighContrastVibrantDark
            
            if isHighContrast, let hc = highContrastId {
                return resolveNative(from: hc, components: highContrastComponents, space: colorSpace)
            }
            if isDark, let dark = darkId {
                return resolveNative(from: dark, components: darkComponents, space: colorSpace)
            }
            return resolveNative(from: id, components: components, space: colorSpace)
        }
        #endif
    }
    
    // MARK: - Private Helpers
    
    func resolveNative(from input: String, components: RGBA?, space: SPColorSpace) -> NativeColor {
        if let metadata = Self.registry[input] {
            return metadata.native
        }
        
        // Fast path: use pre-parsed components if available
        if let c = components {
            switch space {
            case .sRGB:
                return NativeColor(red: c.r, green: c.g, blue: c.b, alpha: c.a)
            case .displayP3:
                return NativeColor(displayP3Red: c.r, green: c.g, blue: c.b, alpha: c.a)
            }
        }
        // Fallback (should theoretically not be hit if init is correct)
        return SPColor.nativeColor(from: input, colorSpace: space)
    }

    static func nativeColor(from hex: String, colorSpace: SPColorSpace) -> NativeColor {
        guard let c = parseHex(hex) else {
            return NativeColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        switch colorSpace {
        case .sRGB:
            return NativeColor(red: c.r, green: c.g, blue: c.b, alpha: c.a)
        case .displayP3:
            return NativeColor(displayP3Red: c.r, green: c.g, blue: c.b, alpha: c.a)
        }
    }
}
