//
//  SPColor-Extensions.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//
import SwiftUI

// MARK: - Extensions

extension NativeColor {
    @MainActor
    public var spColor: SPColor { SPColor(nativeColor: self) }
    
    func toHex8(in space: SPColorSpace) -> String? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        
        let targetSpace: CGColorSpace?
        switch space {
        case .sRGB:
            targetSpace = CGColorSpace(name: CGColorSpace.sRGB)
        case .displayP3:
            targetSpace = CGColorSpace(name: CGColorSpace.displayP3)
        }
        
        guard let targetSpace else { return nil }
        
        #if canImport(UIKit)
        guard let converted = self.cgColor.converted(to: targetSpace, intent: .defaultIntent, options: nil),
              let comps = converted.components, comps.count >= 3 else {
            return nil
        }
        r = comps[0]; g = comps[1]; b = comps[2]; a = converted.alpha
        #else
        // On macOS, usingColorSpace is preferred for NSColor
        let nsSpace: NSColorSpace?
        switch space {
        case .sRGB: nsSpace = .sRGB
        case .displayP3: nsSpace = .displayP3
        }
        
        guard let nsSpace, let converted = self.usingColorSpace(nsSpace) else {
            return nil
        }
        converted.getRed(&r, green: &g, blue: &b, alpha: &a)
        #endif
        
        let f = { (v: CGFloat) in Int((min(max(v, 0), 1) * 255)) }
        return String(format: "#%02x%02x%02x%02x", f(r), f(g), f(b), f(a))
    }
}