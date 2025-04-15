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
    
    #if os(macOS)
        let outlineColor = Color.black
    #elseif os(visionOS)
        let outlineColor = Color.primary
    #else
        var outlineColor: Color{ colorScheme == .dark ? Color.white : Color.black }
    #endif
    
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: size, maximum: size))]){
            ForEach(SymbolColor.allCases){
                SPColorOption(pickerData: pickerData, color: $0)
            }
            let binding = Binding {
                pickerData.colorValue?.wrappedValue.color ?? .clear
            } set: { newValue in
                pickerData.colorValue?.wrappedValue = .customColor(newValue.components)
            }

            SPCustomColorPicker(pickerData: pickerData, geo: geo, size: size)
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

}

struct SPColorOption: View{
    var pickerData: SymbolPickerData
    var color: SymbolColor
    #if os(macOS)
        var symbolName: String{
            if case .customColor = color {
                "pencil.circle.fill"
            }else{
                pickerData.colorValue?.wrappedValue == color ? "checkmark.circle.fill" : "circle.fill"
            }
        }
    #else
        let symbolName = "circle.fill"
    #endif
    var body: some View{
        Button{
            pickerData.colorValue?.wrappedValue = color
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
                        .stroke(outlineColor.opacity(pickerData.colorValue?.wrappedValue == color ? 0.2 : 0), lineWidth: 2.7)
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


struct SPCustomColorPicker: View {
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
    var size: CGFloat
    var body: some View {
        let binding = Binding {
            pickerData.colorValue?.wrappedValue.color ?? .clear
        } set: { newValue in
            pickerData.colorValue?.wrappedValue = .customColor(newValue.components)
        }
        #if os(macOS)
        ZStack{
            ColorPicker("Color Picker", selection: binding, supportsOpacity: false)
                .labelsHidden()
                .frame(width: size, height: size)
                .clipped()
                .opacity(0.03)
            SPColorOption(pickerData: pickerData, color: .customColor(binding.wrappedValue.components))
                .allowsHitTesting(false)
        }
        #else
        if #available(iOS 15.0, visionOS 1.0, macOS 13.0, *){
            SPCustomColorPickerNew(geo: geo, color: binding)
                .frame(width: size, height: size)
        } else {
            SPCustomColorPickerOld(geo: geo, color: $color)
                .frame(width: size, height: size)
        }
        #endif
    }
}

@available(iOS 15.0, visionOS 1.0, macOS 13.0, *)
struct SPCustomColorPickerNew: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var geo: GeometryProxy
    @Binding var color: Color
    
    var scale: CGFloat{
        switch dynamicTypeSize{
        case .xSmall: return geo.size.width / 380
        case .small: return geo.size.width / 350
        case .medium: return geo.size.width / 320
        case .large: return geo.size.width / 280
        case .xLarge: return geo.size.width / 280
        case .xxLarge: return geo.size.width / 270
        case .xxxLarge: return geo.size.width / 270
        case .accessibility1: return geo.size.width / 260
        case .accessibility2: return geo.size.width / 240
        case .accessibility3: return geo.size.width / 210
        case .accessibility4: return geo.size.width / 190
        case .accessibility5: return geo.size.width / 160
        @unknown default: return geo.size.width / 280
        }
    }
    var body: some View {
        ColorPicker("Color Picker", selection: $color, supportsOpacity: false)
            .labelsHidden()
            .scaleEffect(scale)
    }
}

struct SPCustomColorPickerOld: View {
    @Environment(\.sizeCategory) var sizeCategory
    var geo: GeometryProxy
    @Binding var color: Color
    
    var scale: CGFloat{
        switch sizeCategory{
        case .extraSmall: return geo.size.width / 380
        case .small: return geo.size.width / 350
        case .medium: return geo.size.width / 320
        case .large: return geo.size.width / 280
        case .extraLarge: return geo.size.width / 280
        case .extraExtraLarge: return geo.size.width / 270
        case .extraExtraExtraLarge: return geo.size.width / 270
        case .accessibilityMedium: return geo.size.width / 260
        case .accessibilityLarge: return geo.size.width / 240
        case .accessibilityExtraLarge: return geo.size.width / 210
        case .accessibilityExtraExtraLarge: return geo.size.width / 190
        case .accessibilityExtraExtraExtraLarge: return geo.size.width / 160
        @unknown default: return geo.size.width / 280
        }
    }
    var body: some View {
        ColorPicker("Color Picker", selection: $color, supportsOpacity: false)
            .labelsHidden()
            .scaleEffect(scale)
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
