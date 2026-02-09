//
//  SPColor.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
public typealias NativeColor = UIColor
#elseif canImport(AppKit)
import AppKit
public typealias NativeColor = NSColor
#endif

// MARK: - SPColor
public struct SPColor: Identifiable, Sendable, ShapeStyle, ExpressibleByStringLiteral, ExpressibleByIntegerLiteral, Codable, CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    // MARK: - Public Properties
    
    public let colorSpace: SPColor.ColorSpace
    public var id: String { primary.id }
    public var darkId: String? { dark?.id }
    public var highContrastId: String? { highContrast?.id }
    public var isLight: Bool { luminance > 0.5 }
    public var isDark: Bool { !isLight }
    public var luminance: Double {
        guard let c = components else { return 0.5 }
        return SPColorLuminance.calculate(for: c, in: colorSpace)
    }
    
    public func opacity(_ amount: Double) -> SPColor {
        guard let c = components else { return self }
        return SPColor(red: c.r, green: c.g, blue: c.b, opacity: c.a * amount, colorSpace: self.colorSpace)
    }
    
    // MARK: - Internal Properties
    let primary: ColorDefinition
    let dark: ColorDefinition?
    let highContrast: ColorDefinition?
    
    internal var components: RGBA? {
        switch primary {
        case .standard(let name): return SPColor.registry[name]?.components
        case .custom(let converter): return converter.rgba
        }
    }
    
    internal var darkComponents: RGBA? {
        switch dark {
        case .standard(let name): return SPColor.registry[name]?.components
        case .custom(let converter): return converter.rgba
        case .none: return nil
        }
    }
    
    internal var highContrastComponents: RGBA? {
        switch highContrast {
        case .standard(let name): return SPColor.registry[name]?.components
        case .custom(let converter): return converter.rgba
        case .none: return nil
        }
    }
    
    // MARK: - Descriptions
    public var description: String {
        if let metadata = Self.registry[id] { return metadata.localizedKey }
        return "SymbolPickerColors.CustomColor"
    }
    
    public var debugDescription: String {
        return "SPColor(id: \(id), darkId: \(darkId ?? "nil"), highContrastId: \(highContrastId ?? "nil"), colorSpace: \(colorSpace.rawValue))"
    }
    
    public var customMirror: Mirror {
        Mirror(self, children: [
            "id": id,
            "darkId": darkId as Any,
            "highContrastId": highContrastId as Any,
            "colorSpace": colorSpace,
            "luminance": luminance,
            "isLight": isLight
        ])
    }
    
    // MARK: - Initializers
    public init?(id: String, darkId: String? = nil, highContrastId: String? = nil, colorSpace: SPColor.ColorSpace = .sRGB) {
        guard let primary = Self.makeDefinition(from: id) else { return nil }
        self.primary = primary
        self.dark = darkId.flatMap { Self.makeDefinition(from: $0) }
        self.highContrast = highContrastId.flatMap { Self.makeDefinition(from: $0) }
        self.colorSpace = colorSpace
    }
    
    public init(red: Double, green: Double, blue: Double, opacity: Double = 1, colorSpace: SPColor.ColorSpace = .sRGB) {
        let converter = SPColorHexConverter(red: red, green: green, blue: blue, alpha: opacity)
        self.init(primary: .custom(converter), dark: nil, highContrast: nil, colorSpace: colorSpace)
    }
    
    public init(stringLiteral value: String) {
        if let instance = SPColor(id: value) {
            self = instance
        } else {
            self = .black
        }
    }
    
    public init(integerLiteral value: IntegerLiteralType) {
        let converter = SPColorHexConverter(value)
        self.init(primary: .custom(converter), dark: nil, highContrast: nil, colorSpace: .sRGB)
    }

    public init(_ color: Color) {
        self.init(nativeColor: NativeColor(color))
    }
    public init(cgColor: CGColor) {
        #if canImport(AppKit)
        self.init(nativeColor: NativeColor(cgColor: cgColor) ?? .black)
        #else
        self.init(nativeColor: NativeColor(cgColor: cgColor))
        #endif
    }
    public init(ciColor: CIColor) {
        self.init(nativeColor: NativeColor(ciColor: ciColor))
    }
    public init(nativeColor: NativeColor) {
        let targetSpace: SPColor.ColorSpace
        
        let cgColor = nativeColor.cgColor
        if let cgSpace = cgColor.colorSpace {
            let name = cgSpace.name
            if name == CGColorSpace.displayP3 {
                targetSpace = .displayP3
            } else if name == CGColorSpace.linearSRGB {
                targetSpace = .sRGBLinear
            } else if name == CGColorSpace.extendedSRGB {
                targetSpace = .extendedSRGB
            } else if name == CGColorSpace.adobeRGB1998 {
                targetSpace = .adobeRGB
            } else if name == CGColorSpace.rommrgb {
                targetSpace = .rommRGB
            } else {
                targetSpace = .sRGB
            }
        } else {
            targetSpace = .sRGB
        }
        
        // FAST PATH: Match against standard colors using sRGB hex
        // Guard: Only use this path if we are operating in sRGB to avoid clamping wide-gamut inputs.
        if (targetSpace == .sRGB || targetSpace == .sRGBLinear),
           let converter = SPColorHexConverter(color: nativeColor, in: .sRGB) {
            if let matchId = Self.hexRegistry[converter.hex], let instance = SPColor(id: matchId) {
                self = instance
                return
            }
            
            // FUZZY PATH: Handle platform-specific color shifts (Hex Drift)
            if let matchId = Self.closestMatch(to: converter.rgba), let instance = SPColor(id: matchId) {
                self = instance
                return
            }
        }
        
        let makeDef: (NativeColor) -> ColorDefinition = { color in
            if let converter = SPColorHexConverter(color: color, in: targetSpace) {
                return .custom(converter)
            }
            return .custom(SPColorHexConverter(red: 0, green: 0, blue: 0, alpha: 1))
        }
        
        #if canImport(UIKit)
        let lightColor = nativeColor.resolvedColor(with: .init(userInterfaceStyle: .light))
        let darkColor = nativeColor.resolvedColor(with: .init(userInterfaceStyle: .dark))
        let hcColor = nativeColor.resolvedColor(with: .init(accessibilityContrast: .high))
        
        let primary = makeDef(lightColor)
        let dark = (darkColor.cgColor != lightColor.cgColor) ? makeDef(darkColor) : nil
        let hc = (hcColor.cgColor != lightColor.cgColor) ? makeDef(hcColor) : nil
        #elseif canImport(AppKit)
        var primary: ColorDefinition = .custom(SPColorHexConverter(red: 0, green: 0, blue: 0, alpha: 1))
        var dark: ColorDefinition? = nil
        var hc: ColorDefinition? = nil
        
        if let aqua = NSAppearance(named: .aqua) {
            aqua.performAsCurrentDrawingAppearance {
                primary = makeDef(nativeColor)
            }
        }
        if let darkAqua = NSAppearance(named: .darkAqua) {
            darkAqua.performAsCurrentDrawingAppearance {
                let dDef = makeDef(nativeColor)
                if dDef != primary { dark = dDef }
            }
        }
        if let hcAqua = NSAppearance(named: .accessibilityHighContrastAqua) {
            hcAqua.performAsCurrentDrawingAppearance {
                let hDef = makeDef(nativeColor)
                if hDef != primary { hc = hDef }
            }
        }
        #endif
        
        self.init(primary: primary, dark: dark, highContrast: hc, colorSpace: targetSpace)
    }
    
    internal init(primary: ColorDefinition, dark: ColorDefinition?, highContrast: ColorDefinition?, colorSpace: SPColor.ColorSpace) {
        self.primary = primary
        self.dark = dark
        self.highContrast = highContrast
        self.colorSpace = colorSpace
    }
    
    // MARK: - Native Conversion
    
    public var color: Color { Color(nativeColor) }
    
    public var nativeColor: NativeColor {
        if dark == nil && highContrast == nil, let metadata = Self.registry[id] {
            return metadata.native
        }
        
        #if canImport(UIKit)
        return UIColor { traitCollection in
            let isDark = traitCollection.userInterfaceStyle == .dark
            let isHighContrast = traitCollection.accessibilityContrast == .high
            
            if isHighContrast {
                if let hc = highContrastId {
                    return resolveNative(from: hc, components: highContrastComponents, space: colorSpace)
                }
                // Automatic High Contrast Fallback: Contrast Stretch
                // We shift the color components toward the poles (0.0 or 1.0) to increase separation.
                let baseComponents = (isDark ? darkComponents : nil) ?? components
                if let c = baseComponents {
                    let luminance = SPColorLuminance.calculate(for: c, in: colorSpace)
                    let factor = 0.45 // 45% shift toward pole
                    
                    let newR, newG, newB: Double
                    if luminance > 0.5 {
                        // Light color: make it even lighter
                        newR = c.r + (1.0 - c.r) * factor
                        newG = c.g + (1.0 - c.g) * factor
                        newB = c.b + (1.0 - c.b) * factor
                    } else {
                        // Dark color: make it even darker
                        newR = c.r * (1.0 - factor)
                        newG = c.g * (1.0 - factor)
                        newB = c.b * (1.0 - factor)
                    }
                    return resolveNative(from: "hc_fallback", components: RGBA(r: newR, g: newG, b: newB, a: c.a), space: colorSpace)
                }
            }
            if isDark, let dark = darkId {
                return resolveNative(from: dark, components: darkComponents, space: colorSpace)
            }
            return resolveNative(from: id, components: components, space: colorSpace)
        }
        #elseif canImport(AppKit)
        return NSColor(name: nil) { appearance in
            let isDark = appearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
            let name = appearance.name.rawValue
            let isHighContrast = name.contains("HighContrast")
            
            if isHighContrast {
                if let hc = highContrastId {
                    return resolveNative(from: hc, components: highContrastComponents, space: colorSpace)
                }
                // Automatic High Contrast Fallback: Contrast Stretch
                let baseComponents = (isDark ? darkComponents : nil) ?? components
                if let c = baseComponents {
                    let luminance = SPColorLuminance.calculate(for: c, in: colorSpace)
                    let factor = 0.45 // 45% shift toward pole
                    
                    let newR, newG, newB: Double
                    if luminance > 0.5 {
                        newR = c.r + (1.0 - c.r) * factor
                        newG = c.g + (1.0 - c.g) * factor
                        newB = c.b + (1.0 - c.b) * factor
                    } else {
                        newR = c.r * (1.0 - factor)
                        newG = c.g * (1.0 - factor)
                        newB = c.b * (1.0 - factor)
                    }
                    return resolveNative(from: "hc_fallback", components: RGBA(r: newR, g: newG, b: newB, a: c.a), space: colorSpace)
                }
            }
            if isDark, let dark = darkId {
                return resolveNative(from: dark, components: darkComponents, space: colorSpace)
            }
            return resolveNative(from: id, components: components, space: colorSpace)
        }
        #endif
    }
    
    private func resolveNative(from input: String, components: RGBA?, space: SPColor.ColorSpace) -> NativeColor {
        if let metadata = Self.registry[input] {
            return metadata.native
        }
        
        if let c = components {
#if canImport(UIKit) || canImport(AppKit)
            let cgSpaceName: CFString
            switch space {
            case .sRGB: cgSpaceName = CGColorSpace.sRGB
            case .sRGBLinear: cgSpaceName = CGColorSpace.linearSRGB
            case .extendedSRGB: cgSpaceName = CGColorSpace.extendedSRGB
            case .displayP3: cgSpaceName = CGColorSpace.displayP3
            case .adobeRGB: cgSpaceName = CGColorSpace.adobeRGB1998
            case .rommRGB: cgSpaceName = CGColorSpace.rommrgb
            }
            
            if let cgSpace = CGColorSpace(name: cgSpaceName),
               let cgColor = CGColor(colorSpace: cgSpace, components: [CGFloat(c.r), CGFloat(c.g), CGFloat(c.b), CGFloat(c.a)]) {
#if canImport(UIKit)
                return NativeColor(cgColor: cgColor)
#else
                return NativeColor(cgColor: cgColor) ?? NativeColor(red: c.r, green: c.g, blue: c.b, alpha: c.a)
#endif
            }
#endif
            
            // Fallback for non-supported spaces or if CGColor init fails
            switch space {
            case .displayP3:
                return NativeColor(displayP3Red: c.r, green: c.g, blue: c.b, alpha: c.a)
            default:
                return NativeColor(red: c.r, green: c.g, blue: c.b, alpha: c.a)
            }
        }
        return NativeColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    // MARK: - Parsing Helpers
    static func makeDefinition(from id: String) -> ColorDefinition? {
        let clean = id.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        if SPColor.isStandardName(clean) {
            return .standard(name: clean)
        }
        
        if let converter = SPColorHexConverter(clean) {
            return .custom(converter)
        }
        
        return nil
    }
    
    // MARK: - Protocol Conformance
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(darkId)
        hasher.combine(highContrastId)
        hasher.combine(colorSpace)
    }
    
    public static func == (lhs: SPColor, rhs: SPColor) -> Bool {
        return lhs.id == rhs.id &&
        lhs.darkId == rhs.darkId &&
        lhs.highContrastId == rhs.highContrastId &&
        lhs.colorSpace == rhs.colorSpace
    }
    
    public func resolve(in proxy: EnvironmentValues) -> Color {
        return color
    }
    
    // MARK: - Codable
    @_documentation(visibility: internal)
    public enum CodingKeys: String, CodingKey {
        case id, darkId, highContrastId, colorSpace
        case components, darkComponents, highContrastComponents
    }
    
    @_documentation(visibility: internal)
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let darkId = try container.decodeIfPresent(String.self, forKey: .darkId)
        let highContrastId = try container.decodeIfPresent(String.self, forKey: .highContrastId)
        let colorSpace = try container.decode(SPColor.ColorSpace.self, forKey: .colorSpace)
        
        let resolveDef = { (id: String, key: CodingKeys) -> ColorDefinition? in
            let clean = id.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            if SPColor.isStandardName(clean) {
                return .standard(name: clean)
            }
            
            // For custom colors, prioritize high-fidelity components if they exist
            if let comps = try? container.decodeIfPresent(RGBA.self, forKey: key) {
                return .custom(SPColorHexConverter(red: comps.r, green: comps.g, blue: comps.b, alpha: comps.a))
            }
            
            // Fallback to parsing the hex ID
            if let converter = SPColorHexConverter(clean) {
                return .custom(converter)
            }
            return nil
        }
        guard let primary = resolveDef(id, .components) else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: container, debugDescription: "Invalid color ID")
        }
        
        let dark = darkId.flatMap { resolveDef($0, .darkComponents) }
        let highContrast = highContrastId.flatMap { resolveDef($0, .highContrastComponents) }
        
        self.init(primary: primary, dark: dark, highContrast: highContrast, colorSpace: colorSpace)
    }
    
    @_documentation(visibility: internal)
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(darkId, forKey: .darkId)
        try container.encodeIfPresent(highContrastId, forKey: .highContrastId)
        try container.encode(colorSpace, forKey: .colorSpace)
        
        // IMPORTANT: High-fidelity components are encoded separately to preserve HDR/Extended data.
        // The 'id' property (hex) is clamped and lossy; this field is the source of truth for custom colors.
        // Optimization: Only encode components for custom colors to reduce payload size.
        if case .custom = primary, let c = components { 
            try container.encode(c, forKey: .components) 
        }
        
        if let d = dark, case .custom = d, let c = darkComponents { 
            try container.encode(c, forKey: .darkComponents) 
        }
        
        if let h = highContrast, case .custom = h, let c = highContrastComponents { 
            try container.encode(c, forKey: .highContrastComponents) 
        }
    }
}

// MARK: - Native Color Extensions
extension NativeColor {
    public var spColor: SPColor { SPColor(nativeColor: self) }
}
extension Color {
    public var spColor: SPColor { SPColor(nativeColor: NativeColor(self)) }
}
extension CIColor {
    public var spColor: SPColor { SPColor(nativeColor: NativeColor(ciColor: self)) }
}
extension CGColor {
    public var spColor: SPColor { SPColor(nativeColor: NativeColor(cgColor: self) ?? .black) }
}
