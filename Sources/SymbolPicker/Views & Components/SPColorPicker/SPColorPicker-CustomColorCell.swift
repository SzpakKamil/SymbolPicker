//
//  SPColorPickerCustomColorCell.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 21/02/2026.
//

import SwiftUI
import ColorKit

#if !os(watchOS) && !os(tvOS)
struct SPColorPickerCustomColorCell: View {
    @Environment(\.spSelection) var spSelection
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var isFocused: Bool
    
    var color: CKColor
    let style: SPColorPicker.Configuration
    var size: CGFloat
    
    let rainbowGradient = AngularGradient(
        colors: [.yellow, .red, .purple, .blue, .green, .yellow],
        center: .center,
        startAngle: .degrees(-90),
        endAngle: .degrees(270)
    )
    
    var body: some View {
        let isSelected = !style.colors.contains(color)
        SPColorPickerColorCell(color: color, size: size, isSelected: isSelected, rainbowOutline: true) {}
            .overlay {
                ColorPicker(selection: spSelection.asCKColor.asColor, supportsOpacity: style.supportOpacity) {}
                    .scaleEffect(size * 0.1)
                    .offset(x: size * -1.0)
                    .opacity(0.05)
                    .contentShape(Rectangle())
            }
            .clipShape(Circle())
            .contentShape(Circle())
    }
    
    init(color: CKColor, size: CGFloat, style: SPColorPicker.Configuration) {
        self.color = color
        self.size = size
        self.style = style
    }
}
#endif
