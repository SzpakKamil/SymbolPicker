//
//  SPSelectedSymbol.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

import SwiftUI

#if swift(>=6.2)
@_documentation(visibility: internal)
struct SPSelectedSymbol: View, @MainActor Equatable {
    var symbolName: String
    var colorValue: SymbolColor?
    var geo: GeometryProxy
    var calculatedScale: CGFloat
    var calculatedOffset: CGFloat
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPSelectedSymbolNew(symbolName: symbolName, colorValue: colorValue, geo: geo, calculatedScale: calculatedScale, calculatedOffset: calculatedOffset)
        }else{
            SPSelectedSymbolOld(symbolName: symbolName, colorValue: colorValue, geo: geo)
        }
    }
    
    init(symbolName: String, colorValue: SymbolColor? = nil, geo: GeometryProxy, calculatedScale: CGFloat = 0, calculatedOffset: CGFloat = 0) {
        self.symbolName = symbolName
        self.colorValue = colorValue
        self.geo = geo
        self.calculatedScale = calculatedScale
        self.calculatedOffset = calculatedOffset
    }
    
    @MainActor static func ==(lhs: SPSelectedSymbol, rhs: SPSelectedSymbol) -> Bool{
        lhs.symbolName == rhs.symbolName && lhs.colorValue == rhs.colorValue && lhs.calculatedScale == rhs.calculatedScale && lhs.calculatedOffset == rhs.calculatedOffset
    }
    
}

 @available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
@_documentation(visibility: internal)
struct SPSelectedSymbolNew: View, @MainActor Equatable {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var symbolName: String
    var colorValue: SymbolColor?
    var geo: GeometryProxy
    var calculatedScale: CGFloat
    var calculatedOffset: CGFloat
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
        SPSelectedSymbolContent(symbolName: symbolName, colorValue: colorValue, geo: geo, size: size, calculatedScale: calculatedScale, calculatedOffset: calculatedOffset)
    }
    
    @MainActor static func ==(lhs: SPSelectedSymbolNew, rhs: SPSelectedSymbolNew) -> Bool{
        lhs.symbolName == rhs.symbolName && lhs.colorValue == rhs.colorValue && lhs.calculatedScale == rhs.calculatedScale && lhs.calculatedOffset == rhs.calculatedOffset
    }
}

 @_documentation(visibility: internal)
struct SPSelectedSymbolContent: View, @MainActor Equatable {
    var symbolName: String
    var colorValue: SymbolColor?
    @Environment(\.colorScheme) var colorScheme
    var geo: GeometryProxy
    var size: CGFloat
    var calculatedScale: CGFloat
    var calculatedOffset: CGFloat
    
    var body: some View {
        ZStack{
            #if !os(macOS)
            if #available(iOS 26.0, visionOS 26.0, *) {
                VariableBlurView(direction: .blurredTopClearBottom)
                    .frame(height: size * 1.5)
                    .animation(.smooth, value: calculatedScale)
                    .offset(y: -25)
                    .ignoresSafeArea()
            }
            #endif
            HStack{
                Spacer()
                Image(systemName: symbolName)
                    .if{ content in
                        if #available(iOS 26.0, visionOS 26.0, *){
                            let size = size
                            content
                                .resizable()
                                .scaledToFit()
                                .frame(width: size, height: size)
                                .padding(size * 0.35)
                                .spForegroundStyle(colorValue == .customColor(red: 0, green: 0, blue: 0, alpha: 1) ? .primary : .white)
                                .background(LinearGradient(
                                    colors: [(colorValue?.color ?? .clear), (colorValue?.color ?? .clear).opacity(0.9)],
                                    startPoint: colorScheme == .dark ? .topLeading : .bottomTrailing,
                                    endPoint: colorScheme == .dark ? .bottomTrailing : .topLeading))
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .shadow(color: (colorValue?.color ?? .black).opacity(0.5), radius: 20)
                                .scaleEffect(calculatedScale)
                                .offset(y: calculatedOffset)
                        }else{
                            content
                                .font(.largeTitle)
                                .frame(width: size, height: size)
                                .padding(size * 0.15)
                                .spForegroundStyle(colorValue == .customColor(red: 0, green: 0, blue: 0, alpha: 1) ? .primary : .white)
                                .background((colorValue?.color ?? .clear))
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        }
                    }
                
                Spacer()
            }
            .if{ content in
                if #available(iOS 26.0, visionOS 26.0, *){
                    content.padding(.top, 20)
                }else{
                    content
                }
            }
            .padding(.vertical, 5)
        }
    }
    
    @MainActor static func ==(lhs: SPSelectedSymbolContent, rhs: SPSelectedSymbolContent) -> Bool{
        lhs.symbolName == rhs.symbolName && lhs.colorValue == rhs.colorValue && lhs.calculatedScale == rhs.calculatedScale && lhs.calculatedOffset == rhs.calculatedOffset && lhs.size == rhs.size
    }
}

 @_documentation(visibility: internal)
struct SPSelectedSymbolOld: View, @MainActor Equatable {
    @Environment(\.sizeCategory) var sizeCategory
    var symbolName: String
    var colorValue: SymbolColor?
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
        SPSelectedSymbolContent(symbolName: symbolName, colorValue: colorValue, geo: geo, size: size, calculatedScale: 0, calculatedOffset: 0)
    }
    
    @MainActor static func ==(lhs: SPSelectedSymbolOld, rhs: SPSelectedSymbolOld) -> Bool{
        lhs.symbolName == rhs.symbolName && lhs.colorValue == rhs.colorValue && lhs.sizeCategory == rhs.sizeCategory
    }
}
#else
@_documentation(visibility: internal)
struct SPSelectedSymbol: View, Equatable {
    var symbolName: String
    var colorValue: SymbolColor?
    var geo: GeometryProxy
    var calculatedScale: CGFloat
    var calculatedOffset: CGFloat
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPSelectedSymbolNew(symbolName: symbolName, colorValue: colorValue, geo: geo, calculatedScale: calculatedScale, calculatedOffset: calculatedOffset)
        }else{
            SPSelectedSymbolOld(symbolName: symbolName, colorValue: colorValue, geo: geo)
        }
    }
    
    init(symbolName: String, colorValue: SymbolColor? = nil, geo: GeometryProxy, calculatedScale: CGFloat = 0, calculatedOffset: CGFloat = 0) {
        self.symbolName = symbolName
        self.colorValue = colorValue
        self.geo = geo
        self.calculatedScale = calculatedScale
        self.calculatedOffset = calculatedOffset
    }
    
    static func ==(lhs: SPSelectedSymbol, rhs: SPSelectedSymbol) -> Bool{
        lhs.symbolName == rhs.symbolName && lhs.colorValue == rhs.colorValue && lhs.calculatedScale == rhs.calculatedScale && lhs.calculatedOffset == rhs.calculatedOffset
    }
    
}

 @available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
@_documentation(visibility: internal)
struct SPSelectedSymbolNew: View, Equatable {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var symbolName: String
    var colorValue: SymbolColor?
    var geo: GeometryProxy
    var calculatedScale: CGFloat
    var calculatedOffset: CGFloat
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
        SPSelectedSymbolContent(symbolName: symbolName, colorValue: colorValue, geo: geo, size: size, calculatedScale: calculatedScale, calculatedOffset: calculatedOffset)
    }
    
    static func ==(lhs: SPSelectedSymbolNew, rhs: SPSelectedSymbolNew) -> Bool{
        lhs.symbolName == rhs.symbolName && lhs.colorValue == rhs.colorValue && lhs.calculatedScale == rhs.calculatedScale && lhs.calculatedOffset == rhs.calculatedOffset
    }
}

 @_documentation(visibility: internal)
struct SPSelectedSymbolContent: View, Equatable {
    var symbolName: String
    var colorValue: SymbolColor?
    @Environment(\.colorScheme) var colorScheme
    var geo: GeometryProxy
    var size: CGFloat
    var calculatedScale: CGFloat
    var calculatedOffset: CGFloat
    
    var body: some View {
        ZStack{
            #if !os(macOS)
            if #available(iOS 26.0, visionOS 26.0, *) {
                VariableBlurView(direction: .blurredTopClearBottom)
                    .frame(height: size * 1.5)
                    .animation(.smooth, value: calculatedScale)
                    .offset(y: -25)
                    .ignoresSafeArea()
            }
            #endif
            HStack{
                Spacer()
                Image(systemName: symbolName)
                    .if{ content in
                        if #available(iOS 26.0, visionOS 26.0, *){
                            let size = size
                            content
                                .resizable()
                                .scaledToFit()
                                .frame(width: size, height: size)
                                .padding(size * 0.35)
                                .spForegroundStyle(colorValue == .customColor(red: 0, green: 0, blue: 0, alpha: 1) ? .primary : .white)
                                .background(LinearGradient(
                                    colors: [(colorValue?.color ?? .clear), (colorValue?.color ?? .clear).opacity(0.9)],
                                    startPoint: colorScheme == .dark ? .topLeading : .bottomTrailing,
                                    endPoint: colorScheme == .dark ? .bottomTrailing : .topLeading))
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .shadow(color: (colorValue?.color ?? .black).opacity(0.5), radius: 20)
                                .scaleEffect(calculatedScale)
                                .offset(y: calculatedOffset)
                        }else{
                            content
                                .font(.largeTitle)
                                .frame(width: size, height: size)
                                .padding(size * 0.15)
                                .spForegroundStyle(colorValue == .customColor(red: 0, green: 0, blue: 0, alpha: 1) ? .primary : .white)
                                .background((colorValue?.color ?? .clear))
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        }
                    }
                
                Spacer()
            }
            .if{ content in
                if #available(iOS 26.0, visionOS 26.0, *){
                    content.padding(.top, 20)
                }else{
                    content
                }
            }
            .padding(.vertical, 5)
        }
    }
    
    static func ==(lhs: SPSelectedSymbolContent, rhs: SPSelectedSymbolContent) -> Bool{
        lhs.symbolName == rhs.symbolName && lhs.colorValue == rhs.colorValue && lhs.calculatedScale == rhs.calculatedScale && lhs.calculatedOffset == rhs.calculatedOffset && lhs.size == rhs.size
    }
}

 @_documentation(visibility: internal)
struct SPSelectedSymbolOld: View, Equatable {
    @Environment(\.sizeCategory) var sizeCategory
    var symbolName: String
    var colorValue: SymbolColor?
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
        SPSelectedSymbolContent(symbolName: symbolName, colorValue: colorValue, geo: geo, size: size, calculatedScale: 0, calculatedOffset: 0)
    }
    
    static func ==(lhs: SPSelectedSymbolOld, rhs: SPSelectedSymbolOld) -> Bool{
        lhs.symbolName == rhs.symbolName && lhs.colorValue == rhs.colorValue && lhs.sizeCategory == rhs.sizeCategory
    }
}
#endif
