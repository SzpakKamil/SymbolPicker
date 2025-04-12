//
//  SPColorPicker.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

import SwiftUI

struct SPColorPicker: View {
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPColorPickerNew(pickerData: pickerData, geo: geo)
        }else{
            SPColorPickerOld(pickerData: pickerData, geo: geo)
        }
    }
}

struct SPColorPickerContent: View {
    @Environment(\.colorScheme) var colorScheme
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
    var size: CGFloat
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: size, maximum: size))]){
            ForEach(SymbolColor.allCases){
                colorOption(for: $0)
            }
        }
#if os(macOS)
        .padding(.top, 12)
        .padding(.horizontal, 7)
#else
        .padding(.vertical, 3)
#endif
#if os(macOS)
        Divider()
#endif
    }
    
    @ViewBuilder
    public func colorOption(for color: SymbolColor) -> some View{
#if os(macOS)
        let symbolName = pickerData.colorValue?.wrappedValue == color.color ? "checkmark.circle.fill" : "circle.fill"
        let outlineColor = Color.black
#else
#if os(visionOS)
        let outlineColor = Color.primary
#else
        let outlineColor = colorScheme == .dark ? Color.white : Color.black
#endif
        let symbolName = "circle.fill"
#endif
        Button{
            pickerData.colorValue?.wrappedValue = color.color
        }label:{
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
#if os(iOS) || os(visionOS)
                .overlay(
                    Circle()
                        .stroke(.black.opacity(0.05), lineWidth: 2)
                )
#else
                .overlay(
                    Circle()
                        .stroke(.black.opacity(0.05), lineWidth: 3)
                )
#endif
                .clipShape(.circle)
#if os(macOS)
                .padding(2)
#else
                .padding(4.5)
                .overlay(
                    Circle()
                        .stroke(outlineColor.opacity(pickerData.colorValue?.wrappedValue == color.color ? 0.2 : 0), lineWidth: 2.7)
                )
#endif
            
        }
        .accessibilityElement()
        .accessibilityLabel(color.name)
        .accessibilityAddTraits(.isButton)
        .spForegroundStyle(color.color)
        .buttonStyle(.plain)
    }
}

@available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
struct SPColorPickerNew: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
    #if os(iOS) || os(visionOS)
    var gridSize: CGFloat {
        switch dynamicTypeSize{
        case .xSmall: return geo.size.width * 0.08
        case .small: return geo.size.width * 0.085
        case .medium: return geo.size.width * 0.095
        case .large: return geo.size.width * 0.105
        case .xLarge: return geo.size.width * 0.11
        case .xxLarge: return geo.size.width * 0.115
        case .xxxLarge: return geo.size.width * 0.12
        case .accessibility1: return geo.size.width * 0.13
        case .accessibility2: return geo.size.width * 0.14
        case .accessibility3: return geo.size.width * 0.145
        case .accessibility4: return geo.size.width * 0.17
        case .accessibility5: return geo.size.width * 0.185
        @unknown default: return geo.size.width * 0.135
        }
    }
    #else
    let gridSize: CGFloat = 21
    #endif
    var body: some View {
        SPColorPickerContent(pickerData: pickerData, geo: geo, size: gridSize)
    }
}

struct SPColorPickerOld: View {
    @Environment(\.sizeCategory) var sizeCategory
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
#if os(iOS) || os(visionOS)
    var gridSize: CGFloat {
        switch sizeCategory{
        case .extraSmall: return geo.size.width * 0.08
        case .small: return geo.size.width * 0.085
        case .medium: return geo.size.width * 0.095
        case .large: return geo.size.width * 0.105
        case .extraLarge: return geo.size.width * 0.11
        case .extraExtraLarge: return geo.size.width * 0.115
        case .extraExtraExtraLarge: return geo.size.width * 0.12
        case .accessibilityMedium: return geo.size.width * 0.13
        case .accessibilityLarge: return geo.size.width * 0.14
        case .accessibilityExtraLarge: return geo.size.width * 0.145
        case .accessibilityExtraExtraLarge: return geo.size.width * 0.17
        case .accessibilityExtraExtraExtraLarge: return geo.size.width * 0.185
        @unknown default: return geo.size.width * 0.135
        }
    }
#else
    let gridSize: CGFloat = 21
#endif
    var body: some View {
        SPColorPickerContent(pickerData: pickerData, geo: geo, size: gridSize)
    }
}
