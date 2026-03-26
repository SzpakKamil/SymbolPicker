# ``SymbolPicker/SymbolPickerModifier``

A SwiftUI `ViewModifier` that manages the configuration and appearance of a `SymbolPicker` when presented via a view extension.

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

`SymbolPickerModifier` is the underlying engine for the `.symbolPicker(...)` view extensions. It encapsulates a ``SymbolPicker/SymbolPickerConfiguration`` and provides a fluent API for customizing the picker's behavior and style before it is presented to the user.

### Fluent API

The modifier provides a wide range of methods that mirror those found on the ``SymbolPicker/SymbolPicker`` struct itself. This allows you to chain customization calls directly on the presentation modifier, ensuring a clean and readable implementation.

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spDisplayStyle(.compact)
    .spSymbolsVariant(.hierarchical)
    .spColorPickerEnabled(true)
```

## Topics

### Display and Behavior Modifiers
- ``SymbolPicker/SymbolPickerModifier/spDisplayStyle(_:)``
- ``SymbolPicker/SymbolPickerModifier/spSymbolsVariant(_:)``
- ``SymbolPicker/SymbolPickerModifier/spAllowSearching(_:)``
- ``SymbolPicker/SymbolPickerModifier/spPageTypes(_:defaultType:)-(SPPageType...,_)``
- ``SymbolPicker/SymbolPickerModifier/spPageTypes(_:defaultType:)-([SPPageType],_)``
- ``SymbolPicker/SymbolPickerModifier/spInsetedViews(replaceDefaults:views:)``
- ``SymbolPicker/SymbolPickerModifier/spSpacing(_:)``

### Color Picker Modifiers
- ``SymbolPicker/SymbolPickerModifier/spColorPickerEnabled(_:)``
- ``SymbolPicker/SymbolPickerModifier/spColorPickerColors(_:)-([CKColor])``
- ``SymbolPicker/SymbolPickerModifier/spColorPickerColors(_:)-(CKColor...)``
- ``SymbolPicker/SymbolPickerModifier/spColorPickerLayout(_:spacing:)``
- ``SymbolPicker/SymbolPickerModifier/spColorPickerSupportsOpacity(_:)``
- ``SymbolPicker/SymbolPickerModifier/spColorPickerSupportsCustomColor(_:)``

### Option List Appearance Modifiers
- ``SymbolPicker/SymbolPickerModifier/spOptionListCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListInnerPaddingFactor(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListForeground(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListForegroundFocused(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListForegroundPressed(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListForegroundSelected(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListBackground(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListBackgroundFocused(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListBackgroundSelected(_:)``
- ``SymbolPicker/SymbolPickerModifier/spOptionListBackgroundPressed(_:)``

### Presentation Modifiers
These modifiers specifically control the sheet or popover that contains the picker.

- ``SymbolPicker/SymbolPickerModifier/spPresentationType(_:)``
- ``SymbolPicker/SymbolPickerModifier/spPresentationCornerRadius(_:)``
- ``SymbolPicker/SymbolPickerModifier/spPresentationDragIndicator(_:)``
- ``SymbolPicker/SymbolPickerModifier/spPresentationBackgroundColor(_:)``
- ``SymbolPicker/SymbolPickerModifier/spPresentationContentInteraction(_:)``
- ``SymbolPicker/SymbolPickerModifier/spPresentationBackgroundInteraction(_:)``
- ``SymbolPicker/SymbolPickerModifier/spPresentationDents(_:)``

### Selection Preview Modifiers
- ``SymbolPicker/SymbolPickerModifier/spSelectionPreviewCornerRadiusFactor(_:)``
- ``SymbolPicker/SymbolPickerModifier/spSelectionPreviewCalculateOffset(_:)``
- ``SymbolPicker/SymbolPickerModifier/spSelectionPreviewCalculateScale(_:)``
