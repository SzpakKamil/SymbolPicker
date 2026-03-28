//
//  SPSpacing-Default.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 15/03/2026.
//

import SwiftUI

public extension SymbolPickerConfiguration {
    @MainActor
    @SPSpacingBuilder
    func spacingConfiguration() -> [SPSpacing] { Self.defaultSpacingConfiguration() }
    
    @MainActor
    var spacings: [SPSpacing]{ spacingConfiguration() }
    
    @SPSpacingBuilder
    static func defaultSpacingConfiguration() -> [SPSpacing] {
        SPSpacing(component: .colorPicker) { typeSize in
            let baseSizes: [DynamicTypeSize: CGFloat] = [
                .xSmall: 45, .small: 45, .medium: 45, .large: 50, .xLarge: 55, .xxLarge: 60, .xxxLarge: 65,
                .accessibility1: 70, .accessibility2: 75, .accessibility3: 80, .accessibility4: 85, .accessibility5: 90
            ]
            let base = baseSizes[typeSize] ?? 0
            #if os(macOS)
            let factor: CGFloat = 0.4
            #elseif os(tvOS)
            let factor: CGFloat = 1.4
            #else
            let factor: CGFloat = 1.0
            #endif
            return .init(width: base * factor, height: base * factor, horizontalPadding: 0, verticalPadding: 0)
        }
        
        SPSpacing(component: .optionList) { typeSize in
            let baseSizes: [DynamicTypeSize: CGFloat] = [
                .xSmall: 18, .small: 20, .medium: 22, .large: 24, .xLarge: 26, .xxLarge: 28, .xxxLarge: 30,
                .accessibility1: 32, .accessibility2: 34, .accessibility3: 36, .accessibility4: 38, .accessibility5: 40
            ]
            let base = baseSizes[typeSize] ?? 0
            #if os(iOS)
            return .init(width: base * 1.4, height: (base * 1.4) * 1.25, horizontalPadding: 20, verticalPadding: 20)
            #elseif os(macOS)
            return .init(width: base * 1.0, height: (base * 1.0) * 1.25, horizontalPadding: 15, verticalPadding: 15)
            #elseif os(tvOS)
            if #available(tvOS 26.0, *) {
                return .init(width: base * 3.5, height: (base * 3.5) * 1.25, horizontalPadding: 30, verticalPadding: 30)
            } else {
                return .init(width: base * 4.0, height: (base * 4.0) * 1.25, horizontalPadding: 80, verticalPadding: 80)
            }
            #elseif os(visionOS)
            return .init(width: base * 1.2, height: (base * 1.2) * 1.25, horizontalPadding: 20, verticalPadding: 15)
            #elseif os(watchOS)
            return .init(width: base * 0.85, height: (base * 0.85) * 1.25, horizontalPadding: 10, verticalPadding: 0)
            #else
            return .init(width: base, height: base * 1.25, horizontalPadding: 0, verticalPadding: 0)
            #endif
        }
        
        SPSpacing(component: .previewSelection) { typeSize in
            let baseSizes: [DynamicTypeSize: CGFloat] = [
                .xSmall: 45, .small: 45, .medium: 45, .large: 50, .xLarge: 55, .xxLarge: 60, .xxxLarge: 65,
                .accessibility1: 70, .accessibility2: 75, .accessibility3: 80, .accessibility4: 85, .accessibility5: 90
            ]
            let base = baseSizes[typeSize] ?? 0
            #if os(iOS)
            return .init(width: base * 1.0, height: base * 1.0, horizontalPadding: 0, verticalPadding: 0)
            #elseif os(macOS)
            return .init(width: base * 0.5, height: base * 0.5, horizontalPadding: 0, verticalPadding: 0)
            #elseif os(tvOS)
            if #available(tvOS 26.0, *) {
                return .init(width: base * 1.75, height: base * 1.75, horizontalPadding: 0, verticalPadding: 0)
            } else {
                return .init(width: base * 3.0, height: base * 3.0, horizontalPadding: 0, verticalPadding: 0)
            }
            #elseif os(visionOS)
            return .init(width: base * 1.0, height: base * 1.0, horizontalPadding: 0, verticalPadding: 0)
            #elseif os(watchOS)
            return .init(width: base * 0.4, height: base * 0.4, horizontalPadding: 0, verticalPadding: 0)
            #else
            return .init(width: base, height: base, horizontalPadding: 0, verticalPadding: 0)
            #endif
        }
    }
}
