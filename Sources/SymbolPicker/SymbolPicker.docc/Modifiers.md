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

### Core Behavior Modifiers
These modifiers affect the fundamental state and visual style of the picker.

- ``SymbolPicker/SymbolPicker/spDisplayStyle(_:)``
- ``SymbolPicker/SymbolPicker/spSymbolsVariant(_:)``
- ``SymbolPicker/SymbolPicker/spAllowSearching(_:)``
- ``SymbolPicker/SymbolPicker/spPageTypes(_:defaultType:)``

### Component Layout Modifiers
These modifiers control how individual parts of the picker are arranged.

- ``SymbolPicker/SymbolPicker/spInsetedViews(replaceDefaults:views:)``
- ``SymbolPicker/SymbolPicker/spSpacing(content:)``

### Color Picker (`SPColorPicker`) Modifiers
These modifiers specifically target the color selection interface.

- ``SymbolPicker/SymbolPicker/spColorPickerEnabled(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerColors(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerLayout(_:spacing:)``
- ``SymbolPicker/SymbolPicker/spColorPickerSupportsOpacity(_:)``
- ``SymbolPicker/SymbolPicker/spColorPickerSupportsCustomColor(_:)``

### Option List (`SPOptionList`) Modifiers
These modifiers affect the appearance of the main grid of assets and their individual cells.

- ``SymbolPicker/SymbolPicker/spOptionListCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListInnerPaddingFactor(_:)``
- ``SymbolPicker/SymbolPicker/spOptionListForeground(_:state:)``
- ``SymbolPicker/SymbolPicker/spOptionListBackground(_:state:)``

### Presentation (`SPPresentationConfiguration`) Modifiers
These modifiers control how the picker is presented as a sheet, full-screen cover, or popover.

- ``SymbolPicker/SymbolPicker/spPresentationType(_:)``
- ``SymbolPicker/SymbolPicker/spPresentationCornerRadius(_:)``
- ``SymbolPicker/SymbolPicker/spPresentationDragIndicator(_:)``
- ``SymbolPicker/SymbolPicker/spPresentationBackgroundColor(_:)``
- ``SymbolPicker/SymbolPicker/spPresentationContentInteraction(_:)``
- ``SymbolPicker/SymbolPicker/spPresentationBackgroundInteraction(_:)``
- ``SymbolPicker/SymbolPicker/spPresentationDents(_:)``

### Selection Preview (`SPSelectionPreview`) Modifiers
These modifiers enable advanced visual effects for the selection preview.

- ``SymbolPicker/SymbolPicker/spSelectionPreviewCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateOffset(_:)``
- ``SymbolPicker/SymbolPicker/spSelectionPreviewCalculateScale(_:)``
