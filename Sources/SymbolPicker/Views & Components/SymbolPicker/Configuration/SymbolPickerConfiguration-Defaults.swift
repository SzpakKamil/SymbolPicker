//
//  SymbolPickerConfiguration-Defaults.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

@MainActor
public extension SymbolPickerConfiguration {
    func colorPickerConfiguration() -> SPColorPickerConfiguration? { return .init(style: displayStyle) }
    
    func presentationConfiguration() -> SPPresentationConfiguration { return .init(style: displayStyle) }
    
    func optionListConfiguration() -> SPOptionListConfiguration { return .init() }
    
    @SPInsetedViewBuilder
    func insetViewsConfiguration() -> [SPInsetedView] { Self.defaultInsetViews(for: displayStyle, colorPicker: colorPicker) }

    @SPSpacingBuilder
    func spacingConfiguration() -> [SPSpacing] { Self.defaultSpacingConfiguration() }
    
    var spacings: [SPSpacing]{ spacingConfiguration() }
    
    var symbolVariant: SPSymbol.Variant { .filled }
    
    var supportedTypes: [SPPageType] { SPPageType.allCases }
    
    var defaultType: SPPageType { .symbol }
    
    var displayStyle: SPDisplayStyle {
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            return .compact
        } else {
            return .detail
        }
    }
    
    internal var colorPicker: SPColorPickerConfiguration? { colorPickerConfiguration() }
    
    internal var presentation: SPPresentationConfiguration { presentationConfiguration() }
    
    internal var optionList: SPOptionListConfiguration { optionListConfiguration() }
    
    internal var insetViews: [SPInsetedView] { insetViewsConfiguration() }
}
