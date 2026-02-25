//
//  SPOptionListButtonStyle.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 21/02/2026.
//

import SwiftUI

struct SPOptionListButtonStyle: ButtonStyle {
    #if !os(watchOS) && !os(visionOS)
    @Environment(\.colorScheme) var colorScheme
    #endif
    let isSelected: Bool
    let isFocused: Bool
    let size: CGFloat
    
    var backgroundColor: Color{
        #if os(tvOS)
        if #available(tvOS 26.0, *){
            if colorScheme == .light{
                return Color.white
            }else{
                return Color.white.opacity(0.15)
            }
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
        
            .frame(width: size, height: size * 1.25, alignment: .center)
            .padding(size * 0.25)
            .foregroundStyle(Color.primary)
            #if os(tvOS)
            .background(isFocused ? backgroundColor : .clear)
                
            #endif
            .background {
                if configuration.isPressed {
                    #if os(tvOS)
                    Color.clear
                    #else
                    backgroundColor.opacity(0.10)
                    #endif
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
            #if os(watchOS)
            .clipShape(RoundedRectangle(cornerRadius: size * 0.45, style: .continuous))
            #else
            .clipShape(RoundedRectangle(cornerRadius: size * 0.25, style: .continuous))
            #endif
            #if os(tvOS)
            .if { content in
                if #available(tvOS 17.0, *) {
                    content.hoverEffect(.highlight)
                } else {
                    content
                        .scaleEffect(isFocused ? 1.15 : 1.0)
                        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
                        .animation(.smooth(duration: 0.2), value: isFocused)
                }
            }
            #elseif os(visionOS)
            .hoverEffect(.lift)
            .clipShape(RoundedRectangle(cornerRadius: size * 0.45, style: .continuous))
            #endif
            .transition(.opacity)
            .animation(.smooth(duration: 0.2), value: isSelected)
            .animation(.smooth(duration: 0.2), value: configuration.isPressed)
    }
}
