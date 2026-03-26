# Modifiers

Reference for the available `SymbolPicker` modifiers.

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

## Overview

`SymbolPicker` provides a vast collection of modifiers that allow you to customize its visual style, layout, and functionality. These modifiers can be applied directly to a ``SymbolPicker/SymbolPicker`` instance or to the `.symbolPicker()` SwiftUI View extension.

## Modifier Categories

### Display and Behavior Modifiers
- ``SymbolPicker/SymbolPicker/spDisplayStyle(_:)``
- ``SymbolPicker/SymbolPicker/spSymbolsVariant(_:)``
- ``SymbolPicker/SymbolPicker/spAllowSearching(_:)``
- ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)-(SPPageType...,_)``
- ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)-([SPPageType],_)``
- ``SymbolPicker/SymbolPicker/spInsetedViews(replaceDefaults:views:)``
- ``SymbolPicker/SymbolPicker/spSpacing(_:)``

### Color Picker Modifiers
- ``SymbolPicker/SymbolPicker/spColorPickerEnabled(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)-([CKColor])``
- ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)-(CKColor...)``
- ``SymbolPicker/SymbolPicker/spColorPickerLayout(_:spacing:)``
- ``SymbolPicker/SymbolPicker/spColorPickerSupportsOpacity(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerSupportsCustomColor(_:)``

### Option List Appearance Modifiers
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

### Selection Preview Modifiers
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateOffset(_:)``
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateScale(_:)``
