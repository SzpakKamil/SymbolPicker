//
//  SPOptionList-ButtonStyle.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

struct SPOptionListButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.symbolPickerStyle) var style
    
    let isSelected: Bool
    let isFocused: Bool
    
    var width: CGFloat { style.spacings.getValue(.width, for: .optionList, at: dynamicTypeSize) }
    var height: CGFloat { style.spacings.getValue(.height, for: .optionList, at: dynamicTypeSize) }
    var cornerRadius: CGFloat {  width * style.optionList.optionListCornerRadiusFactor }
    var padding: CGFloat {  width * style.optionList.optionListInnerPaddingFactor }
    
    func getForegroundColor(configuration: Configuration) -> Color {
        if configuration.isPressed{
            style.optionList.optionListForegroundPressed
        }else if isFocused{
            style.optionList.optionListForegroundFocused
        }else if isSelected{
            style.optionList.optionListForegroundSelected
        }else{
            style.optionList.optionListForeground
        }
    }
    func getBackgroundColor(configuration: Configuration) -> Color {
        if configuration.isPressed{
            style.optionList.optionListBackgroundPressed
        }else if isFocused{
            style.optionList.optionListBackgroundFocused
        }else if isSelected{
            style.optionList.optionListBackgroundSelected
        }else{
            style.optionList.optionListBackground
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .frame(width: width, height: height, alignment: .center)
                .padding(padding)
                .foregroundStyle(getForegroundColor(configuration: configuration))
                .background(getBackgroundColor(configuration: configuration))
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        }
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
        .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .hoverEffect(.lift)
        #endif
        .transition(.opacity)
        .animation(.smooth(duration: 0.2), value: isSelected)
        .animation(.smooth(duration: 0.2), value: configuration.isPressed)
    }
}
