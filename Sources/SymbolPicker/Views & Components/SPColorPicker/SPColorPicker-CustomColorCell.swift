//
//  SPColorPicker-CustomColorCell.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

#if !os(watchOS) && !os(tvOS)
struct SPColorPickerCustomColorCell: View {
    @Environment(\.spSelection) var spSelection
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var isFocused: Bool
    
    var color: CKColor
    let config: SPColorPickerConfiguration
    var width: CGFloat
    var height: CGFloat
    
    let rainbowGradient = AngularGradient(
        colors: [.yellow, .red, .purple, .blue, .green, .yellow],
        center: .center,
        startAngle: .degrees(-90),
        endAngle: .degrees(270)
    )
    
    var body: some View {
        let isSelected = !config.colors.contains(color)
        SPColorPickerColorCell(color: color, width: width, height: height, isSelected: isSelected, rainbowOutline: true) {}
            .overlay {
                ColorPicker(selection: spSelection.asCKColor.asColor, supportsOpacity: config.supportOpacity) {}
                    .scaleEffect(width * 0.1)
                    .offset(x: width * -1.0)
                    .opacity(0.05)
                    .contentShape(Rectangle())
            }
            .clipShape(Circle())
            .contentShape(Circle())
    }
    
    init(color: CKColor, width: CGFloat, height: CGFloat, config: SPColorPickerConfiguration) {
        self.color = color
        self.width = width
        self.height = height
        self.config = config
    }
}
#endif
