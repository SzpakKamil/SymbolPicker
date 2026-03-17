//
//  SymbolPickerConfiguration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public protocol SymbolPickerConfiguration: Sendable {
    @MainActor
    func presentationConfiguration() -> SPPresentationConfiguration
    
    @MainActor
    func colorPickerConfiguration() -> SPColorPickerConfiguration?
    
    @MainActor
    func optionListConfiguration() -> SPOptionListConfiguration
    
    @MainActor
    @SPInsetedViewBuilder func insetViewsConfiguration() -> [SPInsetedView]
    
    @MainActor
    @SPSpacingBuilder func spacingConfiguration() -> [SPSpacing]
    
    @MainActor
    var symbolVariant: SPSymbol.Variant { get }
    
    @MainActor
    var supportedTypes: [SPPageType] { get }
    
    @MainActor
    var defaultType: SPPageType { get }
    
    @MainActor
    var allowSearching: Bool { get }
    
    @MainActor
    var displayStyle: SPDisplayStyle { get }
}
