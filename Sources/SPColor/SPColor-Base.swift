//
//  SPColor-Base.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//
import SwiftUI

#if canImport(UIKit)
import UIKit
public typealias NativeColor = UIColor
#elseif canImport(AppKit)
import AppKit
public typealias NativeColor = NSColor
#endif

/// The color space used for color serialization and rendering.
public enum SPColorSpace: String, Codable, Sendable {
    /// Standard RGB color space.
    case sRGB
    /// Wide gamut Display P3 color space.
    case displayP3
}

/// A universal color token that bridges SwiftUI, UIKit/AppKit, and hex codes.
public struct SPColor: Identifiable, Equatable, Hashable, Sendable {
    
    // MARK: - Internal Storage
    
    enum ColorDefinition: Hashable, Sendable {
        case standard(name: String)
        indirect case custom(hex: String, rgba: RGBA)
        
        var id: String {
            switch self {
            case .standard(let name): return name
            case .custom(let hex, _): return hex
            }
        }
    }
    
    struct RGBA: Hashable, Sendable, Codable {
        let r: Double, g: Double, b: Double, a: Double
    }
    
    let primary: ColorDefinition
    let dark: ColorDefinition?
    let highContrast: ColorDefinition?
    
    
    public let colorSpace: SPColorSpace
    
    // MARK: - Initializers
    
    init?(stringId: String, darkStringId: String?, highContrastStringId: String?, colorSpace: SPColorSpace) {
        guard let primary = Self.makeDefinition(from: stringId) else { return nil }
        self.primary = primary
        self.dark = darkStringId.flatMap { Self.makeDefinition(from: $0) }
        self.highContrast = highContrastStringId.flatMap { Self.makeDefinition(from: $0) }
        self.colorSpace = colorSpace
    }
    
    init(primary: ColorDefinition, dark: ColorDefinition?, highContrast: ColorDefinition?, colorSpace: SPColorSpace) {
        self.primary = primary
        self.dark = dark
        self.highContrast = highContrast
        self.colorSpace = colorSpace
    }
    
    static func makeDefinition(from id: String) -> ColorDefinition? {
        let clean = id.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        if SPColor.isStandardName(clean) {
            return .standard(name: clean)
        }
        
        guard let normalized = SPColor.normalize(hex: clean),
              let components = SPColor.parseHex(normalized) else {
            return nil
        }
        
        return .custom(hex: normalized, rgba: components)
    }
    
    // MARK: - Public Properties
    
    public var id: String { primary.id }
    public var darkId: String? { dark?.id }
    public var highContrastId: String? { highContrast?.id }
    
    // MARK: - Internal Access
    
    var components: RGBA? {
        switch primary {
        case .standard: return nil
        case .custom(_, let c): return c
        }
    }
    
    var darkComponents: RGBA? {
        switch dark {
        case .standard, .none: return nil
        case .custom(_, let c): return c
        }
    }
    
    var highContrastComponents: RGBA? {
        switch highContrast {
        case .standard, .none: return nil
        case .custom(_, let c): return c
        }
    }
}

