//
//  SPSymbolPickerDefaultConfiguration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPSymbolPickerDefaultConfiguration: SPSymbolPickerConfiguration {
    @MainActor public var currentPresentationConfiguration: @MainActor (SPDisplayStyle) -> SPPresentationConfiguration
    
    @MainActor public func presentationConfiguration() -> SPPresentationConfiguration {
        self.currentPresentationConfiguration(displayStyle)
    }
    
    @MainActor public var currentColorPickerConfiguration: @MainActor (SPDisplayStyle) -> SPColorPickerConfiguration?
    
    @MainActor public func colorPickerConfiguration() ->  SPColorPickerConfiguration? {
        self.currentColorPickerConfiguration(displayStyle)
    }
    
    @MainActor public var currentInsetViewConfiguration: @MainActor (SPDisplayStyle, SPColorPickerConfiguration?) -> [SPInsetedView]
    
    @MainActor public func insetViewsConfiguration() -> [SPInsetedView] {
        return self.currentInsetViewConfiguration(displayStyle, colorPicker)
    }
    
    @MainActor public var symbolVariant: SPSymbol.Variant = .filled
    
    @MainActor public var supportedTypes: [SPPageType] = SPPageType.allCases
    
    @MainActor public var defaultType: SPPageType = .symbol
    
    @MainActor public var displayStyle: SPDisplayStyle

    public init() {
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            self.displayStyle = .compact
        } else {
            self.displayStyle = .detail
        }
        self.currentPresentationConfiguration = { SPPresentationConfiguration(style: $0) }
        self.currentColorPickerConfiguration = { SPColorPickerConfiguration(style: $0) }
        self.currentInsetViewConfiguration = { style, colorPicker in
            SPSymbolPickerDefaultConfiguration.defaultInsetViews(for: style, colorPicker: colorPicker)
        }
    }
}
