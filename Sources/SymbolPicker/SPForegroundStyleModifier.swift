//
//  File.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 08/03/2025.
//

import SwiftUI

struct SPForegroundStyleModifier: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        if #available(macOS 12.0, iOS 15.0, visionOS 1.0, *) {
            content
                .foregroundStyle(color)
        } else {
            content
                .foregroundColor(color)
        }
    }
    
    init(color: Color) {
        self.color = color
    }
}

extension View {
    func spForegroundStyle(_ color: Color) -> some View {
        modifier(SPForegroundStyleModifier(color: color))
    }
}
