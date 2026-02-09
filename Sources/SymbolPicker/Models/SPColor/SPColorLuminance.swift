//
//  SPColorLuminance.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI

/// A dynamic property that calculates the relative luminance of an `SPColor` based on the current environment.
///
/// `SPColorLuminance` automatically updates its `wrappedValue` when the `ColorScheme` changes.
public struct SPColorLuminance: DynamicProperty {
    @Environment(\.colorScheme) private var colorScheme
    
    private let color: SPColor
    
    /// Creates a luminance provider for the specified color.
    /// - Parameter color: The `SPColor` to monitor.
    public init(color: SPColor) {
        self.color = color
    }
    
    /// The calculated relative luminance for the current environment.
    public var wrappedValue: Double {
        let components: SPColor.RGBA?
        
        if colorScheme == .dark {
            components = color.darkComponents ?? color.components
        } else {
            components = color.components
        }
        
        guard let c = components else { return 0.5 }
        return Self.calculate(for: c, in: color.colorSpace)
    }
    
    /// Calculates relative luminance for a given set of RGBA components and color space.
    /// - Parameters:
    ///   - components: The RGBA components.
    ///   - colorSpace: The color space of the components.
    /// - Returns: A value between 0.0 (black) and 1.0 (white).
    public static func calculate(for components: SPColor.RGBA, in colorSpace: SPColor.ColorSpace) -> Double {
        // Linearize components based on the color space
        let r = linearize(components.r, space: colorSpace)
        let g = linearize(components.g, space: colorSpace)
        let b = linearize(components.b, space: colorSpace)
        
        switch colorSpace {
        case .sRGB, .sRGBLinear, .extendedSRGB:
            // Standard luminance coefficients (Rec. 709 / sRGB)
            return 0.2126 * r + 0.7152 * g + 0.0722 * b
        case .displayP3:
            // Display P3 specific coefficients (D65)
            return 0.20949 * r + 0.72160 * g + 0.06891 * b
        case .adobeRGB:
            // Adobe RGB (1998)
            return 0.29734 * r + 0.62738 * g + 0.07528 * b
        case .rommRGB:
            // ROMM RGB (ProPhoto RGB)
            // Note: The blue coefficient (0.00009) is mathematically accurate but perceptually dangerous for UI.
            // We apply a "safety floor" to ensure blue-heavy colors don't report near-zero luminance.
            let lum = 0.28804 * r + 0.71187 * g + 0.00009 * b
            return max(lum, 0.2 * b) // Perceptual Safety Floor: Ensure at least 20% of blue intensity is counted
        }
    }
    
    private static func linearize(_ value: Double, space: SPColor.ColorSpace) -> Double {
        switch space {
        case .sRGB, .displayP3, .extendedSRGB:
            // sRGB transfer function (also used by Display P3 and Extended sRGB)
            let absV = abs(value)
            let linearAbsV = absV <= 0.04045 ? absV / 12.92 : pow((absV + 0.055) / 1.055, 2.4)
            return value >= 0 ? linearAbsV : -linearAbsV
            
        case .adobeRGB:
            // Adobe RGB (1998) uses a pure power-law function with gamma ~2.2 (563/256)
            if value >= 0 {
                return pow(value, 2.19921875)
            } else {
                return -pow(-value, 2.19921875)
            }
            
        case .rommRGB:
            // ROMM RGB (ProPhoto RGB) uses gamma 1.8 with a small linear toe
            if value >= 0 {
                return value < 0.031248 ? value / 16.0 : pow(value, 1.8)
            } else {
                let absV = -value
                let linearAbsV = absV < 0.031248 ? absV / 16.0 : pow(absV, 1.8)
                return -linearAbsV
            }
            
        case .sRGBLinear:
            // Already linear
            return value
        }
    }
}

extension SPColor {
    /// Returns the relative luminance of this color for a specific color scheme.
    /// - Parameter scheme: The color scheme to resolve for.
    /// - Returns: A value between 0.0 (black) and 1.0 (white).
    public func luminance(in scheme: ColorScheme) -> Double {
        let components: RGBA?
        
        if scheme == .dark {
            components = darkComponents ?? self.components
        } else {
            components = self.components
        }
        
        guard let c = components else { return 0.5 }
        return SPColorLuminance.calculate(for: c, in: self.colorSpace)
    }
}
