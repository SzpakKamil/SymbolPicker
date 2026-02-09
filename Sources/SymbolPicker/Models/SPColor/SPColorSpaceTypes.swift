//
//  SPColorSpaceTypes.swift
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

// MARK: - SPColorSpace
extension SPColor{
    public enum ColorSpace: String, Codable, Sendable, CaseIterable {
        /// Standard RGB color space.
        case sRGB
        /// Linear sRGB color space.
        case sRGBLinear
        /// Extended sRGB color space.
        case extendedSRGB
        /// Wide gamut Display P3 color space.
        case displayP3
        /// Adobe RGB (1998) color space.
        case adobeRGB
        /// ROMM RGB (ProPhoto RGB) color space.
        case rommRGB
    }
    
    enum ColorDefinition: Hashable, Sendable {
        case standard(name: String)
        case custom(SPColorHexConverter)
        
        var id: String {
            switch self {
            case .standard(let name): return name
            case .custom(let converter): return converter.hex
            }
        }
    }
    public struct RGBA: Hashable, Sendable, Codable {
        public let r: Double, g: Double, b: Double, a: Double
        
        public init(r: Double, g: Double, b: Double, a: Double) {
            self.r = r; self.g = g; self.b = b; self.a = a
        }
    }
}

