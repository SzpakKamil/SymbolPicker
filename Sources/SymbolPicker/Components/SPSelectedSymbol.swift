//
//  SPSelectedSymbol.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

import SwiftUI

struct SPSelectedSymbol: View {
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPSelectedSymbolNew(pickerData: pickerData, geo: geo)
        }else{
            SPSelectedSymbolOld(pickerData: pickerData, geo: geo)
        }
    }
}

@available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
struct SPSelectedSymbolNew: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
    var size: CGFloat{
        switch dynamicTypeSize{
        case .xSmall: return geo.size.width * 0.115
        case .small: return geo.size.width * 0.12
        case .medium: return geo.size.width * 0.125
        case .large: return geo.size.width * 0.13
        case .xLarge: return geo.size.width * 0.135
        case .xxLarge: return geo.size.width * 0.14
        case .xxxLarge: return geo.size.width * 0.145
        case .accessibility1: return geo.size.width * 0.155
        case .accessibility2: return geo.size.width * 0.17
        case .accessibility3: return geo.size.width * 0.185
        case .accessibility4: return geo.size.width * 0.24
        case .accessibility5: return geo.size.width * 0.215
        @unknown default: return geo.size.width * 0.13
        }
    }
    var body: some View {
        SPSelectedSymbolContent(pickerData: pickerData, geo: geo, size: size)
    }
}

struct SPSelectedSymbolContent: View {
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
    var size: CGFloat
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: pickerData.symbolName.wrappedValue)
                .font(.largeTitle)
                .frame(width: size, height: size)
                .padding(size * 0.15)
                .spForegroundStyle(pickerData.colorValue?.wrappedValue == .customColor([0,0,0,1]) ? .primary : .white)
                .background((pickerData.colorValue?.wrappedValue.color ?? .clear))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

struct SPSelectedSymbolOld: View {
    @Environment(\.sizeCategory) var sizeCategory
    let pickerData: SymbolPickerData
    var geo: GeometryProxy
    var size: CGFloat{
        switch sizeCategory{
        case .extraSmall: return geo.size.width * 0.115
        case .small: return geo.size.width * 0.12
        case .medium: return geo.size.width * 0.125
        case .large: return geo.size.width * 0.13
        case .extraLarge: return geo.size.width * 0.135
        case .extraExtraLarge: return geo.size.width * 0.14
        case .extraExtraExtraLarge: return geo.size.width * 0.145
        case .accessibilityMedium: return geo.size.width * 0.155
        case .accessibilityLarge: return geo.size.width * 0.17
        case .accessibilityExtraLarge: return geo.size.width * 0.185
        case .accessibilityExtraExtraLarge: return geo.size.width * 0.24
        case .accessibilityExtraExtraExtraLarge: return geo.size.width * 0.215
        @unknown default: return geo.size.width * 0.13
        }
    }
    
    var body: some View {
        SPSelectedSymbolContent(pickerData: pickerData, geo: geo, size: size)
    }
}


#Preview{
    SymbolPicker(isPresented: .constant(true), symbolName: .constant("bicycle"), color: .constant(SymbolColor.red))
}
