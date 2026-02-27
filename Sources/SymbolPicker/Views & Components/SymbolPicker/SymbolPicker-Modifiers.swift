//
//  SymbolPicker-Modifier.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public extension View {
    func symbolPicker<C: SPSymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection>,
        configuration: C
    ) -> SymbolPickerConfigurationWrapper<C, Self> {
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: selection, configuration: configuration) {
            self
        }
    }
    
    func symbolPicker(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection>
    ) -> SymbolPickerConfigurationWrapper<SPSymbolPickerDefaultConfiguration, Self> {
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: selection, configuration: SPSymbolPickerDefaultConfiguration()) {
            self
        }
    }

    func symbolPicker<C: SPSymbolPickerConfiguration>(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection?>,
        configuration: C
    ) -> SymbolPickerConfigurationWrapper<C, Self> {
        let binding = Binding {
            selection.wrappedValue ?? .color(value: CKColor(hexString: "#0000"))
        } set: { newValue in
            selection.wrappedValue = newValue
        }
        return SymbolPickerConfigurationWrapper(isPresented: isPresented, selection: binding, configuration: configuration) {
            self
        }
    }
    
    func symbolPicker(
        isPresented: Binding<Bool>,
        selection: Binding<SPSelection?>
    ) -> SymbolPickerConfigurationWrapper<SPSymbolPickerDefaultConfiguration, Self> {
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
            copy.style.currentInsetViewConfiguration = views
        }else{
            let currentViews = copy.style.currentInsetViewConfiguration()
            copy.style.currentInsetViewConfiguration = {currentViews + views() }
        }
        return copy
    }
    
    // MARK: SPColorPicker Modifiers
    public func spColorPickerEnabled(_ value: Bool) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerEnabled(value) }
        return results
    }
    public func spColorPickerColors(_ colors: CKColor...) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerColors(colors) }
        return results
    }
    public func spColorPickerColors(_ colors: [CKColor]) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerColors(colors) }
        return results
    }
    public func spColorPickerLayout(_ type: SPColorPickerConfiguration.Direction, spacing: CGFloat? = nil) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerLayout(type, spacing: spacing) }
        return results
    }
    public func spColorPickerSupportsOpacity(_ value: Bool) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerSupportsOpacity(value) }
        return results
    }
    public func spColorPickerSupportsCustomColor(_ value: Bool) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerSupportsCustomColor(value) }
        return results
    }
}

public extension SymbolPickerConfigurationWrapper where C == SPSymbolPickerDefaultConfiguration{
    func spDisplayStyle(_ style: SPDisplayStyle) -> Self{
        var copy = self
        copy.style.displayStyle = style
//        #if os(iOS)
//        copy.spPresentationBackgroundColor(style == .compact ? Color.clear : Color(.systemGroupedBackground))
//        #endif
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
            copy.style.currentInsetViewConfiguration = views
        }else{
            let currentViews = copy.style.currentInsetViewConfiguration()
            copy.style.currentInsetViewConfiguration = {currentViews + views() }
        }
        return copy
    }
    
    // MARK: SPColorPicker Modifiers
    public func spColorPickerEnabled(_ value: Bool) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerEnabled(value) }
        return results
    }
    public func spColorPickerColors(_ colors: CKColor...) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerColors(colors) }
        return results
    }
    public func spColorPickerColors(_ colors: [CKColor]) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerColors(colors) }
        return results
    }
    public func spColorPickerLayout(_ type: SPColorPickerConfiguration.Direction, spacing: CGFloat? = nil) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerLayout(type, spacing: spacing) }
        return results
    }
    public func spColorPickerSupportsOpacity(_ value: Bool) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerSupportsOpacity(value) }
        return results
    }
    public func spColorPickerSupportsCustomColor(_ value: Bool) -> Self{
        var results = self
        results.style.currentColorPickerConfiguration = { self.style.colorPicker?.spColorPickerSupportsCustomColor(value) }
        return results
    }
    
    // MARK: SPPresentation Modifiers
    
    public func spPresentationCornerRadius(_ value: CGFloat) -> Self{
        var result = self
        result.style.currentPresentationConfiguration = { self.style.presentation.spPresentationCornerRadius(value) }
        return result
    }
    public func spPresentationType(_ value: SPPresentationConfiguration.DisplayType) -> Self{
        var result = self
        result.style.currentPresentationConfiguration = { self.style.presentation.spPresentationType(value) }
        return result
    }
    public func spPresentationDragIndicator(_ value: Visibility) -> Self{
        var result = self
        result.style.currentPresentationConfiguration = { self.style.presentation.spPresentationDragIndicator(value) }
        return result
    }
    public func spPresentationBackgroundColor(_ value: Color) -> Self{
        var result = self
        result.style.currentPresentationConfiguration = { self.style.presentation.spPresentationBackgroundColor(value) }
        return result
    }
    public func spPresentationContentInteraction(_ value: SPPresentationConfiguration.ContentInteraction) -> Self{
        var result = self
        result.style.currentPresentationConfiguration = { self.style.presentation.spPresentationContentInteraction(value) }
        return result
    }
    public func spPresentationBackgroundInteraction(_ value: SPPresentationConfiguration.BackgroundInteraction) -> Self{
        var result = self
        result.style.currentPresentationConfiguration = { self.style.presentation.spPresentationBackgroundInteraction(value) }
        return result
    }
    public func spPresentationDents(_ dents: Set<SPPresentationConfiguration.PresentationDents>) -> Self{
        var result = self
        result.style.currentPresentationConfiguration = { self.style.presentation.spPresentationDents(dents) }
        return result
    }


}



