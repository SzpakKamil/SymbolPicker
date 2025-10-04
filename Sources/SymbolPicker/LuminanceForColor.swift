import SwiftUI

#if canImport(UIKit)
import UIKit
private typealias NativeColor = UIColor
#elseif canImport(AppKit)
import AppKit
private typealias NativeColor = NSColor
#endif

extension Color {

    /// WCAG relative luminance (0.0 - 1.0) computed in the sRGB color space.
    /// Uses the standard linearization and weighting: 0.2126 R + 0.7152 G + 0.0722 B
    var luminance: Double {
        let comps = self.components
        func toLinear(_ c: Double) -> Double {
            if c <= 0.04045 {
                return c / 12.92
            } else {
                return pow((c + 0.055) / 1.055, 2.4)
            }
        }

        let r = toLinear(comps[0])
        let g = toLinear(comps[1])
        let b = toLinear(comps[2])
        return 0.2126 * r + 0.7152 * g + 0.0722 * b
    }
}
