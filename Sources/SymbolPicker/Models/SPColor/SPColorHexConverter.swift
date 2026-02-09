//
//  SPColorHexConverter.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// A utility struct that ensures a valid, normalized hex string representation (#RRGGBBAA).
public struct SPColorHexConverter: Sendable, Equatable, Hashable {
    
    /// The normalized 8-character hex string (e.g., "#ff0000ff").
    /// - Warning: This is a lossy representation. External tools reading ONLY this string 
    ///   (like a web CMS) will lose HDR (>1.0) or Extended (<0.0) gamut data.
    public let hex: String
    
    /// The original high-fidelity components, preserved to avoid data loss for HDR or Extended gamut colors.
    internal let originalComponents: SPColor.RGBA?
    
    // MARK: - Initializers
    
    /// Initializes from a string, normalizing it. Returns nil if the string is invalid.
    public init?(_ string: String) {
        guard let normalized = Self.normalize(hex: string) else { return nil }
        self.hex = normalized
        self.originalComponents = nil
    }
    
    /// Initializes from RGBA components, preserving them while generating a compatible hex string.
    public init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.originalComponents = SPColor.RGBA(r: red, g: green, b: blue, a: alpha)
        // Note: Hex representation is limited to 0-255 range.
        // HDR (>1.0) or Extended (<0.0) values are clamped for hex conversion.
        let f = { (v: Double) in Int(round(min(max(v, 0), 1) * 255)) }
        self.hex = String(format: "#%02x%02x%02x%02x", f(red), f(green), f(blue), f(alpha))
    }
    
    /// Initializes from an integer value (0xRRGGBB or 0xRRGGBBAA).
    public init(_ value: Int) {
        let r, g, b, a: Double
        if value > 0xFFFFFF {
            // Assume 0xRRGGBBAA
            r = Double((value >> 24) & 0xFF) / 255.0
            g = Double((value >> 16) & 0xFF) / 255.0
            b = Double((value >> 8) & 0xFF) / 255.0
            a = Double(value & 0xFF) / 255.0
        } else {
            // Assume 0xRRGGBB
            r = Double((value >> 16) & 0xFF) / 255.0
            g = Double((value >> 8) & 0xFF) / 255.0
            b = Double(value & 0xFF) / 255.0
            a = 1.0
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    /// Initializes from a native color in a specific color space.
    public init?(color: NativeColor, in space: SPColor.ColorSpace) {
        let comps = Self.extractComponents(from: color, in: space)
        guard let hexString = Self.toHex8(from: comps) else { return nil }
        self.hex = hexString
        self.originalComponents = comps.flatMap { SPColor.RGBA(r: Double($0.r), g: Double($0.g), b: Double($0.b), a: Double($0.a)) }
    }
    
    // MARK: - Computed Properties
    
    /// Returns the high-fidelity RGBA components if available, otherwise parses from the hex string.
    internal var rgba: SPColor.RGBA {
        if let original = originalComponents { return original }
        // Since 'hex' is guaranteed to be normalized by the initializers, force parsing should be safe-ish,
        // but we'll use a safe fallback just in case.
        if let components = Self.parseHex(self.hex) {
            return components
        }
        return SPColor.RGBA(r: 0, g: 0, b: 0, a: 1)
    }
    
    // MARK: - Internal Helpers
    
    private static func normalize(hex: String) -> String? {
        var clean = hex.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if clean.hasPrefix("#") { clean.removeFirst() }
        
        guard clean.allSatisfy({ $0.isHexDigit }) else { return nil }
        
        switch clean.count {
        case 3:
            let r = clean[clean.startIndex]
            let g = clean[clean.index(clean.startIndex, offsetBy: 1)]
            let b = clean[clean.index(clean.startIndex, offsetBy: 2)]
            return "#\(r)\(r)\(g)\(g)\(b)\(b)ff"
        case 4:
            let r = clean[clean.startIndex]
            let g = clean[clean.index(clean.startIndex, offsetBy: 1)]
            let b = clean[clean.index(clean.startIndex, offsetBy: 2)]
            let a = clean[clean.index(clean.startIndex, offsetBy: 3)]
            return "#\(r)\(r)\(g)\(g)\(b)\(b)\(a)\(a)"
        case 6: return "#" + clean + "ff"
        case 8: return "#" + clean
        default: return nil
        }
    }
    
    private static func parseHex(_ hex: String) -> SPColor.RGBA? {
        var hexClean = hex
        if hexClean.hasPrefix("#") { hexClean.removeFirst() }
        
        guard let int = UInt64(hexClean, radix: 16) else { return nil }
        
        let r = Double((int >> 24) & 0xFF) / 255.0
        let g = Double((int >> 16) & 0xFF) / 255.0
        let b = Double((int >> 8) & 0xFF) / 255.0
        let a = Double(int & 0xFF) / 255.0
        
        return SPColor.RGBA(r: r, g: g, b: b, a: a)
    }
    
    private static func extractComponents(from color: NativeColor, in space: SPColor.ColorSpace) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)? {
        let cgSpaceName: CFString
        switch space {
        case .sRGB: cgSpaceName = CGColorSpace.sRGB
        case .sRGBLinear: cgSpaceName = CGColorSpace.linearSRGB
        case .extendedSRGB: cgSpaceName = CGColorSpace.extendedSRGB
        case .displayP3: cgSpaceName = CGColorSpace.displayP3
        case .adobeRGB: cgSpaceName = CGColorSpace.adobeRGB1998
        case .rommRGB: cgSpaceName = CGColorSpace.rommrgb
        }
        
        guard let targetSpace = CGColorSpace(name: cgSpaceName) else { return nil }
        
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        
        #if canImport(UIKit)
        let finalCGColor: CGColor
        if color.cgColor.colorSpace?.name == cgSpaceName {
            finalCGColor = color.cgColor
        } else if let converted = color.cgColor.converted(to: targetSpace, intent: .defaultIntent, options: nil) {
            finalCGColor = converted
        } else {
            return nil
        }
        
        guard let comps = finalCGColor.components, comps.count >= 3 else { return nil }
        r = comps[0]; g = comps[1]; b = comps[2]; a = finalCGColor.alpha
        #elseif canImport(AppKit)
        let nsSpace: NSColorSpace? = {
            switch space {
            case .sRGB: return .sRGB
            case .displayP3: return .displayP3
            case .adobeRGB: return .adobeRGB1998
            default: return NSColorSpace(cgColorSpace: targetSpace)
            }
        }()
        
        if let nsSpace, let converted = color.usingColorSpace(nsSpace) {
            converted.getRed(&r, green: &g, blue: &b, alpha: &a)
        } else {
            let finalCGColor: CGColor
            if color.cgColor.colorSpace?.name == cgSpaceName {
                finalCGColor = color.cgColor
            } else if let converted = color.cgColor.converted(to: targetSpace, intent: .defaultIntent, options: nil) {
                finalCGColor = converted
            } else {
                return nil
            }
            
            guard let comps = finalCGColor.components, comps.count >= 3 else { return nil }
            r = comps[0]; g = comps[1]; b = comps[2]; a = finalCGColor.alpha
        }
        #endif
        
        return (r, g, b, a)
    }
    
    private static func toHex8(from components: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)?) -> String? {
        guard let c = components else { return nil }
        let f = { (v: CGFloat) in Int(round(min(max(v, 0), 1) * 255)) }
        return String(format: "#%02x%02x%02x%02x", f(c.r), f(c.g), f(c.b), f(c.a))
    }
}
