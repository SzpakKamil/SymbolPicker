//
//  SPColor-Parsing.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//
import Foundation

extension SPColor {

    static func normalize(hex: String) -> String? {
        var clean = hex.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if clean.hasPrefix("#") { clean.removeFirst() }
        
        guard clean.allSatisfy({ $0.isHexDigit }) else { return nil }
        
        switch clean.count {
        case 3: // RGB -> RRGGBBff
            let idx0 = clean.startIndex
            let idx1 = clean.index(idx0, offsetBy: 1)
            let idx2 = clean.index(idx0, offsetBy: 2)
            let r = clean[idx0]
            let g = clean[idx1]
            let b = clean[idx2]
            return "#\(r)\(r)\(g)\(g)\(b)\(b)ff"
            
        case 4: // RGBA -> RRGGBBAA
            let idx0 = clean.startIndex
            let idx1 = clean.index(idx0, offsetBy: 1)
            let idx2 = clean.index(idx0, offsetBy: 2)
            let idx3 = clean.index(idx0, offsetBy: 3)
            let r = clean[idx0]
            let g = clean[idx1]
            let b = clean[idx2]
            let a = clean[idx3]
            return "#\(r)\(r)\(g)\(g)\(b)\(b)\(a)\(a)"
            
        case 6: // RRGGBB -> RRGGBBff
            return "#" + clean + "ff"
            
        case 8: // RRGGBBAA
            return "#" + clean
            
        default:
            return nil
        }
    }

    // Slow path parsing (only used for fallback or init)
    static func parseHex(_ hex: String) -> RGBA? {
        var hexClean = hex
        if hexClean.hasPrefix("#") { hexClean.removeFirst() }
        
        guard let int = UInt64(hexClean, radix: 16) else { return nil }
        
        let r = Double((int >> 24) & 0xFF) / 255.0
        let g = Double((int >> 16) & 0xFF) / 255.0
        let b = Double((int >> 8) & 0xFF) / 255.0
        let a = Double(int & 0xFF) / 255.0
        
        return RGBA(r: r, g: g, b: b, a: a)
    }
}

