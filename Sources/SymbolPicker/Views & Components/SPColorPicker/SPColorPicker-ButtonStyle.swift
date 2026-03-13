//
//  SPColorPicker-ButtonStyle.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

struct SPColorPickerButtonStyle: ButtonStyle {
    #if !os(watchOS) && !os(visionOS)
    @Environment(\.colorScheme) var colorScheme
    #endif
    let isSelected: Bool
    let isFocused: Bool
    let size: CGFloat
    
    var backgroundColor: Color{
        #if os(tvOS)
        if #available(tvOS 26.0, *){
            return Color.primary.opacity(0.3)
        }else{
            if colorScheme == .light{
                return Color.black.opacity(0.15)
            }else{
                return Color.white.opacity(0.15)
            }
        }

        #else
        return Color.primary
        #endif
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size, height: size, alignment: .center)
            .padding(size * 0.15)
            .foregroundStyle(Color.primary)
            .background {
                if configuration.isPressed {
                    backgroundColor.opacity(0.10)
                } else if isSelected {
                    #if os(tvOS)
                    backgroundColor.opacity(0.6)
                    #elseif os(iOS)
                    backgroundColor.opacity(0.15)
                    #else
                    backgroundColor.opacity(0.20)
                    #endif
                } else {
                    Color.clear
                }
            }
            .clipShape(Circle())
            #if os(tvOS)
            .background {
                Circle()
                    .fill(!isSelected && isFocused ? backgroundColor.opacity(0.6) : Color.clear)
            }
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(isFocused ? 1.2 : 1.0)
            .animation(.smooth(duration: 0.2), value: isFocused)
            #elseif os(visionOS)
            .hoverEffect(.lift)
            .clipShape(Circle())
            #endif
            .animation(.smooth(duration: 0.2), value: isSelected)
            .animation(.smooth(duration: 0.2), value: configuration.isPressed)
    }
}

