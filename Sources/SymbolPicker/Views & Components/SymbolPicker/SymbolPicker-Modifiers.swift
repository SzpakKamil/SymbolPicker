//
//  SymbolPicker-Modifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public extension View {
    func symbolPicker<T: SPDataAsset, C: SPSymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection<T>>,
        configuration: C
    ) -> SymbolPickerConfigurationWrapper<T, C, Self> {
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: selection, configuration: configuration) {
            self
        }
    }
    
    func symbolPicker<T: SPDataAsset>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection<T>>
    ) -> SymbolPickerConfigurationWrapper<T, SPSymbolPickerDefaultConfiguration, Self> {
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: selection, configuration: SPSymbolPickerDefaultConfiguration()) {
            self
        }
    }

    func symbolPicker<T: SPDataAsset, C: SPSymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection<T>?>,
        configuration: C
    ) -> SymbolPickerConfigurationWrapper<T, C, Self> {
        let binding = Binding {
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: binding, configuration: configuration) {
            self
        }
    }
    
    func symbolPicker<T: SPDataAsset>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection<T>?>
    ) -> SymbolPickerConfigurationWrapper<T, SPSymbolPickerDefaultConfiguration, Self> {
        let binding = Binding {
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: binding, configuration: SPSymbolPickerDefaultConfiguration()) {
            self
        }
    }
}

public extension SymbolPicker where C == SPSymbolPickerDefaultConfiguration{
    func spDisplayStyle(_ style: SPDisplayStyle) -> Self{
        var copy = self
        copy.style.displayStyle = style
        return copy
    }
    func spSymbolsVariant(_ variant: SPSymbol.Variant) -> Self{
        var copy = self
        copy.style.symbolVariant = variant
        return copy
    }
    func spPageTypes(_ types: SPPageType..., defaultType: SPPageType) -> Self{
        var copy = self
        copy.style.supportedTypes = types
        copy.style.defaultType = defaultType
        return copy
    }
    func spPageTypes(_ types: [SPPageType], defaultType: SPPageType) -> Self{
        var copy = self
        copy.style.supportedTypes = types
        copy.style.defaultType = defaultType
        return copy
    }
    
    func spInsetedViews(overwriteDefault: Bool = false, @SPInsetedViewBuilder views: @Sendable @escaping () -> [SPInsetedView]) -> Self{
        var copy = self
        if overwriteDefault{
            copy.style.currentInsetViewConfiguration = { (style: SPDisplayStyle) in views() }
        }else{
            let current = copy.style.currentInsetViewConfiguration
            copy.style.currentInsetViewConfiguration = { (style: SPDisplayStyle) in current(style) + views() }
        }
        return copy
    }
    
    // MARK: SPColorPicker Modifiers
    func spColorPickerEnabled(_ value: Bool) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerEnabled(value) }
        return results
    }
    func spColorPickerColors(_ colors: CKColor...) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerColors(colors) }
        return results
    }
    func spColorPickerColors(_ colors: [CKColor]) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerColors(colors) }
        return results
    }
    func spColorPickerLayout(_ type: SPColorPickerConfiguration.Direction, spacing: CGFloat? = nil) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerLayout(type, spacing: spacing) }
        return results
    }
    func spColorPickerSupportsOpacity(_ value: Bool) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerSupportsOpacity(value) }
        return results
    }
    func spColorPickerSupportsCustomColor(_ value: Bool) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerSupportsCustomColor(value) }
        return results
    }
}

public extension SymbolPickerConfigurationWrapper where C == SPSymbolPickerDefaultConfiguration{
    func spDisplayStyle(_ style: SPDisplayStyle) -> Self{
        var copy = self
        copy.style.displayStyle = style
        return copy
    }
    func spSymbolsVariant(_ variant: SPSymbol.Variant) -> Self{
        var copy = self
        copy.style.symbolVariant = variant
        return copy
    }
    func spPageTypes(_ types: SPPageType..., defaultType: SPPageType) -> Self{
        var copy = self
        copy.style.supportedTypes = types
        copy.style.defaultType = defaultType
        return copy
    }
    func spPageTypes(_ types: [SPPageType], defaultType: SPPageType) -> Self{
        var copy = self
        copy.style.supportedTypes = types
        copy.style.defaultType = defaultType
        return copy
    }
    
    func spInsetedViews(overwriteDefault: Bool = false, @SPInsetedViewBuilder views: @Sendable @escaping () -> [SPInsetedView]) -> Self{
        var copy = self
        if overwriteDefault{
            copy.style.currentInsetViewConfiguration = { (style: SPDisplayStyle) in views() }
        }else{
            let current = copy.style.currentInsetViewConfiguration
            copy.style.currentInsetViewConfiguration = { (style: SPDisplayStyle) in current(style) + views() }
        }
        return copy
    }
    
    // MARK: SPColorPicker Modifiers
    func spColorPickerEnabled(_ value: Bool) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerEnabled(value) }
        return results
    }
    func spColorPickerColors(_ colors: CKColor...) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerColors(colors) }
        return results
    }
    func spColorPickerColors(_ colors: [CKColor]) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerColors(colors) }
        return results
    }
    func spColorPickerLayout(_ type: SPColorPickerConfiguration.Direction, spacing: CGFloat? = nil) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerLayout(type, spacing: spacing) }
        return results
    }
    func spColorPickerSupportsOpacity(_ value: Bool) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerSupportsOpacity(value) }
        return results
    }
    func spColorPickerSupportsCustomColor(_ value: Bool) -> Self{
        var results = self
        let current = results.style.currentColorPickerConfiguration
        results.style.currentColorPickerConfiguration = { (style: SPDisplayStyle) in current(style)?.spColorPickerSupportsCustomColor(value) }
        return results
    }
    
    // MARK: SPPresentation Modifiers
    
    func spPresentationCornerRadius(_ value: CGFloat) -> Self{
        var result = self
        let current = result.style.currentPresentationConfiguration
        result.style.currentPresentationConfiguration = { (style: SPDisplayStyle) in current(style).spPresentationCornerRadius(value) }
        return result
    }
    func spPresentationType(_ value: SPPresentationConfiguration.DisplayType) -> Self{
        var result = self
        let current = result.style.currentPresentationConfiguration
        result.style.currentPresentationConfiguration = { (style: SPDisplayStyle) in current(style).spPresentationType(value) }
        return result
    }
    func spPresentationDragIndicator(_ value: Visibility) -> Self{
        var result = self
        let current = result.style.currentPresentationConfiguration
        result.style.currentPresentationConfiguration = { (style: SPDisplayStyle) in current(style).spPresentationDragIndicator(value) }
        return result
    }
    func spPresentationBackgroundColor(_ value: Color) -> Self{
        var result = self
        let current = result.style.currentPresentationConfiguration
        result.style.currentPresentationConfiguration = { (style: SPDisplayStyle) in current(style).spPresentationBackgroundColor(value) }
        return result
    }
    func spPresentationContentInteraction(_ value: SPPresentationConfiguration.ContentInteraction) -> Self{
        var result = self
        let current = result.style.currentPresentationConfiguration
        result.style.currentPresentationConfiguration = { (style: SPDisplayStyle) in current(style).spPresentationContentInteraction(value) }
        return result
    }
    func spPresentationBackgroundInteraction(_ value: SPPresentationConfiguration.BackgroundInteraction) -> Self{
        var result = self
        let current = result.style.currentPresentationConfiguration
        result.style.currentPresentationConfiguration = { (style: SPDisplayStyle) in current(style).spPresentationBackgroundInteraction(value) }
        return result
    }
    func spPresentationDents(_ dents: Set<SPPresentationConfiguration.PresentationDents>) -> Self{
        var result = self
        let current = result.style.currentPresentationConfiguration
        result.style.currentPresentationConfiguration = { (style: SPDisplayStyle) in current(style).spPresentationDents(dents) }
        return result
    }


}
