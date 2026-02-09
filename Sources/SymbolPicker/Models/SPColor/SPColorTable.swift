//
//  SPColorTable.swift
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

extension SPColor{
    // MARK: - Default Colors
    public static let red      = SPColor(id: "red") ?? .init(red: 1, green: 0, blue: 0)
    public static let orange   = SPColor(id: "orange") ?? .init(red: 1, green: 0.5, blue: 0)
    public static let yellow   = SPColor(id: "yellow") ?? .init(red: 1, green: 1, blue: 0)
    public static let green    = SPColor(id: "green") ?? .init(red: 0, green: 1, blue: 0)
    public static let mint     = SPColor(id: "mint") ?? .init(red: 0, green: 1, blue: 1)
    public static let teal     = SPColor(id: "teal") ?? .init(red: 0, green: 0.5, blue: 0.5)
    public static let cyan     = SPColor(id: "cyan") ?? .init(red: 0, green: 1, blue: 1)
    public static let blue     = SPColor(id: "blue") ?? .init(red: 0, green: 0, blue: 1)
    public static let indigo   = SPColor(id: "indigo") ?? .init(red: 0.3, green: 0, blue: 0.5)
    public static let purple   = SPColor(id: "purple") ?? .init(red: 0.5, green: 0, blue: 0.5)
    public static let pink     = SPColor(id: "pink") ?? .init(red: 1, green: 0, blue: 0.5)
    public static let brown    = SPColor(id: "brown") ?? .init(red: 0.6, green: 0.4, blue: 0.2)
    public static let gray     = SPColor(id: "gray") ?? .init(red: 0.5, green: 0.5, blue: 0.5)
    public static let white    = SPColor(id: "white") ?? .init(red: 1, green: 1, blue: 1)
    public static let black    = SPColor(id: "black") ?? .init(red: 0, green: 0, blue: 0)
    
    public static let standardColors: [SPColor] = [
        .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue,
        .indigo, .purple, .pink, .brown, .gray, .white, .black
    ]
    
    // MARK: - Registry
    
    struct StandardColorMetadata: Sendable {
        let native: NativeColor
        let localizedKey: String
        let fallbackName: String
        let components: RGBA
    }
    
    static let registry: [String: StandardColorMetadata] = {
        let colors: [(String, NativeColor, String, String)] = [
            ("red", .systemRed, "SymbolPickerColors.Red", "Red"),
            ("orange", .systemOrange, "SymbolPickerColors.Orange", "Orange"),
            ("yellow", .systemYellow, "SymbolPickerColors.Yellow", "Yellow"),
            ("green", .systemGreen, "SymbolPickerColors.Green", "Green"),
            ("mint", .systemMint, "SymbolPickerColors.Mint", "Mint"),
            ("teal", .systemTeal, "SymbolPickerColors.Teal", "Teal"),
            ("cyan", .systemCyan, "SymbolPickerColors.Cyan", "Cyan"),
            ("blue", .systemBlue, "SymbolPickerColors.Blue", "Blue"),
            ("indigo", .systemIndigo, "SymbolPickerColors.Indigo", "Indigo"),
            ("purple", .systemPurple, "SymbolPickerColors.Purple", "Purple"),
            ("pink", .systemPink, "SymbolPickerColors.Pink", "Pink"),
            ("brown", .systemBrown, "SymbolPickerColors.Brown", "Brown"),
            ("gray", .systemGray, "SymbolPickerColors.Gray", "Gray"),
            ("white", .white, "SymbolPickerColors.White", "White"),
            ("black", .black, "SymbolPickerColors.Black", "Black")
        ]
        
        var dict = [String: StandardColorMetadata]()
        for (key, native, loc, fallback) in colors {
            // FIX: Use SPColorHexConverter here to avoid duplicating code
            let rgba = SPColorHexConverter(color: native, in: .sRGB)?.rgba ?? RGBA(r: 0, g: 0, b: 0, a: 1)
            dict[key] = StandardColorMetadata(native: native, localizedKey: loc, fallbackName: fallback, components: rgba)
        }
        return dict
    }()
    
    static let hexRegistry: [String: String] = {
        var dict = [String: String]()
        for (key, metadata) in registry {
            #if canImport(UIKit)
            let traits: [UITraitCollection] = [
                .init(userInterfaceStyle: .light),
                .init(userInterfaceStyle: .dark),
                .init(accessibilityContrast: .high)
            ]
            for trait in traits {
                let resolved = metadata.native.resolvedColor(with: trait)
                if let hex = SPColorHexConverter(color: resolved, in: .sRGB)?.hex {
                    dict[hex] = key
                }
            }
            #elseif canImport(AppKit)
            let appearances: [NSAppearance.Name] = [.aqua, .darkAqua, .accessibilityHighContrastAqua, .accessibilityHighContrastDarkAqua]
            for name in appearances {
                if let appearance = NSAppearance(named: name) {
                    appearance.performAsCurrentDrawingAppearance {
                        if let hex = SPColorHexConverter(color: metadata.native, in: .sRGB)?.hex {
                            dict[hex] = key
                        }
                    }
                }
            }
            #else
            let hex = SPColorHexConverter(red: metadata.components.r, green: metadata.components.g, blue: metadata.components.b, alpha: metadata.components.a).hex
            dict[hex] = key
            #endif
        }
        return dict
    }()
    
    static func isStandardName(_ name: String) -> Bool {
        return registry[name.lowercased()] != nil
    }
    
    static func closestMatch(to components: RGBA, tolerance: Double = 0.02) -> String? {
        // Optimization: Use squared distance to avoid sqrt calls
        let toleranceSq = tolerance * tolerance
        var bestMatch: String? = nil
        var minDistSq = toleranceSq
        
        for (key, metadata) in registry {
            let c = metadata.components
            let dR = c.r - components.r
            let dG = c.g - components.g
            let dB = c.b - components.b
            let dA = c.a - components.a
            
            let distSq = dR*dR + dG*dG + dB*dB + dA*dA
            if distSq < minDistSq {
                minDistSq = distSq
                bestMatch = key
            }
        }
        return bestMatch
    }
}
