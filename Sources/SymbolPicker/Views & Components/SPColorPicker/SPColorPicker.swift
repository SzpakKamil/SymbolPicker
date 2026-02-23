//
//  SPColorPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/02/2026.
//

import SwiftUI
import ColorKit

public struct SPColorPicker: View {
    @Environment(\.spHorizontalPadding) var spHorizontalPadding
    @Environment(\.symbolPickerStyle) var symbolPickerStyle
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.spSelection) var spSelection
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var style = Configuration()
    var currentSize: CGFloat{ SPSpacing.getSize(in: dynamicTypeSize, for: symbolPickerStyle.spacing.colorPicker) }
    var selectedColor: CKColor{ spSelection.wrappedValue.getColor()  ?? CKColor(red: 0, green: 0, blue: 0, opacity: 0) }
    
    public var body: some View {
        if symbolPickerStyle.allowColorSelection {
            colorContainer{
                ForEach(style.colors){ color in
                    SPColorPickerColorCell(color: color, size: currentSize, isSelected: selectedColor == color) {
                        spSelection.asCKColor.wrappedValue = color
                    }
                }
                #if !os(tvOS) && !os(watchOS)
                if style.allowCustomColor{
                    SPColorPickerCustomColorCell(color: selectedColor, size: currentSize, style: style)
                }
                #endif
            }
        }
    }
    
    @ViewBuilder
    private func colorContainer<V: View>(@ViewBuilder content: @escaping () -> V) -> some View {
        let baseLayout = Group {
            switch style.type {
            case .grid:
                LazyVGrid(columns: [.init(.adaptive(minimum: currentSize, maximum: currentSize * 1.1))], spacing: style.spacing ?? currentSize * 0.3) {
                    content()
                }
                .padding(.horizontal, spHorizontalPadding)
            case .row:
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: style.spacing ?? currentSize * 0.3) {
                        #if os(tvOS)
                        content()
                        #else
                        content()
                            .frame(width: currentSize, height: currentSize)
                        #endif
                    }
                    .padding(.horizontal, spHorizontalPadding)
                    .if{ content in if #available(iOS 17.0, macOS 14.0, tvOS 17.0, *){ content.scrollTargetLayout() }else{ content } }
                }
                .if{ content in if #available(iOS 17.0, macOS 14.0, tvOS 17.0, *){ content.scrollTargetBehavior(.viewAligned).scrollClipDisabled() }else{ content } }
                .frame(height: currentSize * 1.1)
            }
        }

        #if os(visionOS) || os(watchOS)
        baseLayout
        #else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, *) {
            GlassEffectContainer(spacing: 0) {
                baseLayout
            }
        } else {
            baseLayout
        }
        #endif
    }
    
    // MARK: - Init
    public init() {}
}
