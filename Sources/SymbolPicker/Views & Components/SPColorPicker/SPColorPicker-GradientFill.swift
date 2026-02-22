//
//  SPColorPickerGradientFill.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import ColorKit
import SwiftUI
    
func spColorPickerGradientFill(for color: CKColor, in colorScheme: ColorScheme) -> LinearGradient{
    let startPoint: UnitPoint = colorScheme == .dark ? .bottom : .top
    let endPoint: UnitPoint = colorScheme == .dark ? .top : .bottom
    return LinearGradient(colors: [color.color.opacity(0.8), color.color], startPoint: startPoint, endPoint: endPoint)
}
