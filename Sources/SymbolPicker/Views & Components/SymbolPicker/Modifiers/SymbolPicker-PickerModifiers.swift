//
//  SymbolPicker-Modifiers.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public extension SymbolPicker where Configuration == SymbolPickerDefaultConfiguration{
    @available(iOS 16.4, *)
    func spDisplayStyle(_ style: SPDisplayStyle) -> Self{
        var copy = self
        var newStyle = copy.style
        newStyle.displayStyle = style
        copy.setStyle(newStyle)
        return copy
    }
    func spSymbolsVariant(_ variant: SPSymbol.Variant) -> Self{
        var copy = self
        var newStyle = copy.style
        newStyle.symbolVariant = variant
        copy.setStyle(newStyle)
        return copy
    }

    func spAllowSearching(_ condition: Bool) -> Self{
        var copy = self
        var newStyle = copy.style
        newStyle.allowSearching = condition
        copy.setStyle(newStyle)
        return copy
    }

    func spPageTypes(_ types: SPPageType..., defaultType: SPPageType) -> Self{
        var copy = self
        var newStyle = copy.style
        newStyle.supportedTypes = types
        newStyle.defaultType = defaultType
        copy.setStyle(newStyle)
        return copy
    }

    func spPageTypes(_ types: [SPPageType], defaultType: SPPageType) -> Self{
        var copy = self
        var newStyle = copy.style
        newStyle.supportedTypes = types
        newStyle.defaultType = defaultType
        copy.setStyle(newStyle)
        return copy
    }
    
    func spInsetedViews(replaceDefaults: Bool = false, @SPInsetedViewBuilder views: @Sendable @escaping () -> [SPInsetedView]) -> Self {
        var copy = self
        let previousConfiguration = copy.style.currentInsetViewConfiguration
        
        copy.style.currentInsetViewConfiguration = { (style, colorPicker) in
            let newViews = views()
            var currentViews = previousConfiguration(style, colorPicker)
            
            for newView in newViews {
                if replaceDefaults, let index = currentViews.firstIndex(where: { $0.placement == newView.placement }) {
                    currentViews[index] = newView
                } else {
                    currentViews.append(newView)
                }
            }
            
            return currentViews
        }
        
        return copy
    }
    
    func spSpacing(@SPSpacingBuilder _ content: @Sendable @escaping () -> [SPSpacing]) -> Self {
        var copy = self
        let previousConfiguration = copy.style.currentSpacingConfiguration
        
        copy.style.currentSpacingConfiguration = { style in
            let newItems = content()
            var configurations = previousConfiguration(style)
            
            for newItem in newItems {
                configurations.removeAll { $0.component == newItem.component }
                configurations.append(newItem)
            }
            return configurations
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
    
    // MARK: SPOptionList Modifiers
    func spOptionListCornerRadiusFactor(_ value: CGFloat) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListCornerRadiusFactor(value) }
        return results
    }
    
    func spOptionListInnerPaddingFactor(_ value: CGFloat) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListInnerPaddingFactor(value) }
        return results
    }
    
    func spOptionListForeground(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListForeground(value) }
        return results
    }
    
    func spOptionListForegroundSelected(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListForegroundSelected(value) }
        return results
    }
    
    func spOptionListForegroundFocused(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListForegroundFocused(value) }
        return results
    }
    
    func spOptionListForegroundPressed(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListForegroundPressed(value) }
        return results
    }
    
    func spOptionListBackground(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListBackground(value) }
        return results
    }
    
    func spOptionListBackgroundSelected(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListBackgroundSelected(value) }
        return results
    }
    
    func spOptionListBackgroundFocused(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListBackgroundFocused(value) }
        return results
    }
    
    func spOptionListBackgroundPressed(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListBackgroundPressed(value) }
        return results
    }
    
    
    // MARK: SPSelectionPreview Modifiers
    func spSelectionPreviewCornerRadiusFactor(_ value: CGFloat) -> Self {
        var results = self
        let current = results.style.currentSelectionPreviewConfiguration
        results.style.currentSelectionPreviewConfiguration = { (style: SPDisplayStyle) in current(style).spSelectionPreviewCornerRadiusFactor(value) }
        return results
    }
    
    #if (os(iOS) || os(visionOS) || os(macOS) || os(tvOS) || os(watchOS)) && compiler(>=6.0)
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    func spSelectionPreviewCalculateOffset(_ closure: @Sendable @escaping (ScrollGeometry) -> CGFloat) -> Self {
        var results = self
        let current = results.style.currentSelectionPreviewConfiguration
        results.style.currentSelectionPreviewConfiguration = { (style: SPDisplayStyle) in current(style).spSelectionPreviewCalculateOffset(closure) }
        return results
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    func spSelectionPreviewCalculateScale(_ closure: @Sendable @escaping (ScrollGeometry) -> CGFloat) -> Self {
        var results = self
        let current = results.style.currentSelectionPreviewConfiguration
        results.style.currentSelectionPreviewConfiguration = { (style: SPDisplayStyle) in current(style).spSelectionPreviewCalculateScale(closure) }
        return results
    }
    #endif
}

public extension SymbolPickerModifier where Configuration == SymbolPickerDefaultConfiguration{
    @available(iOS 16.4, *)
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
    
    func spAllowSearching(_ condition: Bool) -> Self{
        var copy = self
        copy.style.allowSearching = condition
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
    
    func spInsetedViews(replaceDefaults: Bool = false, @SPInsetedViewBuilder views: @Sendable @escaping () -> [SPInsetedView]) -> Self {
        var copy = self
        let previousConfiguration = copy.style.currentInsetViewConfiguration
        
        copy.style.currentInsetViewConfiguration = { (style, colorPicker) in
            let newViews = views()
            var currentViews = previousConfiguration(style, colorPicker)
            
            for newView in newViews {
                if replaceDefaults, let index = currentViews.firstIndex(where: { $0.placement == newView.placement }) {
                    currentViews[index] = newView
                } else {
                    currentViews.append(newView)
                }
            }
            
            return currentViews
        }
        
        return copy
    }
    
    func spSpacing(@SPSpacingBuilder _ content: @Sendable @escaping () -> [SPSpacing]) -> Self {
        var copy = self
        let previousConfiguration = copy.style.currentSpacingConfiguration
        
        copy.style.currentSpacingConfiguration = { style in
            let newItems = content()
            var configurations = previousConfiguration(style)
            
            for newItem in newItems {
                configurations.removeAll { $0.component == newItem.component }
                configurations.append(newItem)
            }
            return configurations
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
    
    // MARK: SPOptionList Modifiers
    func spOptionListCornerRadiusFactor(_ value: CGFloat) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListCornerRadiusFactor(value) }
        return results
    }
    
    func spOptionListInnerPaddingFactor(_ value: CGFloat) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListInnerPaddingFactor(value) }
        return results
    }
    
    func spOptionListForeground(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListForeground(value) }
        return results
    }
    
    func spOptionListForegroundSelected(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListForegroundSelected(value) }
        return results
    }
    
    func spOptionListForegroundFocused(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListForegroundFocused(value) }
        return results
    }
    
    func spOptionListForegroundPressed(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListForegroundPressed(value) }
        return results
    }
    
    func spOptionListBackground(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListBackground(value) }
        return results
    }
    
    func spOptionListBackgroundSelected(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListBackgroundSelected(value) }
        return results
    }
    
    func spOptionListBackgroundFocused(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListBackgroundFocused(value) }
        return results
    }
    
    func spOptionListBackgroundPressed(_ value: Color) -> Self {
        var results = self
        let current = results.style.currentOptionListConfiguration
        results.style.currentOptionListConfiguration = { (style: SPDisplayStyle) in current(style).spOptionListBackgroundPressed(value) }
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
    
    // MARK: SPSelectionPreview Modifiers
    func spSelectionPreviewCornerRadiusFactor(_ value: CGFloat) -> Self {
        var results = self
        let current = results.style.currentSelectionPreviewConfiguration
        results.style.currentSelectionPreviewConfiguration = { (style: SPDisplayStyle) in current(style).spSelectionPreviewCornerRadiusFactor(value) }
        return results
    }
    
    #if (os(iOS) || os(visionOS) || os(macOS) || os(tvOS) || os(watchOS)) && compiler(>=6.0)
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    func spSelectionPreviewCalculateOffset(_ closure: @Sendable @escaping (ScrollGeometry) -> CGFloat) -> Self {
        var results = self
        let current = results.style.currentSelectionPreviewConfiguration
        results.style.currentSelectionPreviewConfiguration = { (style: SPDisplayStyle) in current(style).spSelectionPreviewCalculateOffset(closure) }
        return results
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    func spSelectionPreviewCalculateScale(_ closure: @Sendable @escaping (ScrollGeometry) -> CGFloat) -> Self {
        var results = self
        let current = results.style.currentSelectionPreviewConfiguration
        results.style.currentSelectionPreviewConfiguration = { (style: SPDisplayStyle) in current(style).spSelectionPreviewCalculateScale(closure) }
        return results
    }
    #endif
}
