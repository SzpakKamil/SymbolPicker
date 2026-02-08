//
//  SPSymbol-Methods.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPSymbol{
    static let filePrefix: String = "symbols"
    
    public func isAvailable() -> Bool {
        #if canImport(UIKit)
        return UIImage(systemName: filledName) != nil && UIImage(systemName: notFilled) != nil
        #elseif canImport(AppKit)
        return NSImage(systemSymbolName: filledName, accessibilityDescription: nil) != nil
            && NSImage(systemSymbolName: notFilled, accessibilityDescription: nil) != nil
        #else
        return false
        #endif
    }
}
