//
//  SymbolPickerDefaultConfiguration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SymbolPickerDefaultConfiguration: SymbolPickerConfiguration {
    @MainActor public var currentPresentationConfiguration: @MainActor (SPDisplayStyle) -> SPPresentationConfiguration
    
    @MainActor public func presentationConfiguration() -> SPPresentationConfiguration {
        self.currentPresentationConfiguration(displayStyle)
    }
    
    @MainActor public var currentColorPickerConfiguration: @MainActor (SPDisplayStyle) -> SPColorPickerConfiguration?
    
    @MainActor public func colorPickerConfiguration() ->  SPColorPickerConfiguration? {
        self.currentColorPickerConfiguration(displayStyle)
    }
    
    @MainActor public var currentOptionListConfiguration: @MainActor (SPDisplayStyle) -> SPOptionListConfiguration
    
    @MainActor public func optionListConfiguration() -> SPOptionListConfiguration {
        self.currentOptionListConfiguration(displayStyle)
    }
    
    @MainActor public var currentInsetViewConfiguration: @MainActor (SPDisplayStyle, SPColorPickerConfiguration?) -> [SPInsetedView]
    
    @MainActor public func insetViewsConfiguration() -> [SPInsetedView] {
        return self.currentInsetViewConfiguration(displayStyle, colorPicker)
    }
    
    @MainActor public var currentSpacingConfiguration: @MainActor (SPDisplayStyle) -> [SPSpacing]
    
    @MainActor @SPSpacingBuilder public func spacingConfiguration() -> [SPSpacing] {
        self.currentSpacingConfiguration(displayStyle)
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
        self.currentOptionListConfiguration = { SPOptionListConfiguration(style: $0) }
        self.currentInsetViewConfiguration = { style, colorPicker in
            SymbolPickerDefaultConfiguration.defaultInsetViews(for: style, colorPicker: colorPicker)
        }
        self.currentSpacingConfiguration = { _ in SymbolPickerDefaultConfiguration.defaultSpacingConfiguration() }
    }
}
