//
//  ArrayFromColor.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 15/04/2025.
//

import SwiftUI

extension Color{
    var components: [Double]{
        #if canImport(UIKit)
                typealias NativeColor = UIColor
#elseif canImport(AppKit)
                typealias NativeColor = NSColor
#endif
                
                var r: CGFloat = 0
                var g: CGFloat = 0
                var b: CGFloat = 0
                var o: CGFloat = 1
                
#if !os(macOS)
                guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
                    return [0, 0, 0, 1]
                }
#else
                NativeColor(self).usingColorSpace(.sRGB)?.getRed(&r, green: &g, blue: &b, alpha: &o)
#endif
                
                return  [r, g, b, o]
    }
}
