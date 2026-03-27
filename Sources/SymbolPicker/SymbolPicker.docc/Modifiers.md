# Modifiers

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Customization tools for SymbolPicker.

## Overview

SymbolPicker offers modifiers to change visual styles, layouts, and features. Apply these directly to a ``SymbolPicker/SymbolPicker`` instance or through the `.symbolPicker()` View extension.

## Categories

### Display and Behavior
- ``SymbolPicker/SymbolPicker/spDisplayStyle(_:)``
- ``SymbolPicker/SymbolPicker/spSymbolsVariant(_:)``
- ``SymbolPicker/SymbolPicker/spAllowSearching(_:)``
- ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)-(SPPageType...,_)``
- ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)-([SPPageType],_)``
- ``SymbolPicker/SymbolPicker/spInsetedViews(replaceDefaults:views:)``
- ``SymbolPicker/SymbolPicker/spSpacing(_:)``

### Color Picker
- ``SymbolPicker/SymbolPicker/spColorPickerEnabled(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)-([CKColor])``
- ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)-(CKColor...)``
- ``SymbolPicker/SymbolPicker/spColorPickerLayout(_:spacing:)``
- ``SymbolPicker/SymbolPicker/spColorPickerSupportsOpacity(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerSupportsCustomColor(_:)``

### Option List Appearance
- ``SymbolPicker/SymbolPicker/spOptionListCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListInnerPaddingFactor(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForeground(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForegroundFocused(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForegroundPressed(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForegroundSelected(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackground(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackgroundFocused(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackgroundSelected(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackgroundPressed(_:)``

### Selection Preview
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateOffset(_:)``
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateScale(_:)``
