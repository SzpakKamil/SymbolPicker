# ``SymbolPicker/SPColorPickerConfiguration``

A struct that configures the color picker component within the SymbolPicker.

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

`SPColorPickerConfiguration` provides settings for the embedded color picker, allowing for customization of colors, layout, and support for advanced features like opacity and custom colors.

### View Integration

This configuration is primarily used by the ``SymbolPicker/SPColorPicker`` view and its supporting subviews, such as color cells.

- **Palette Control**: The ``colors`` property defines the array of colors available for the user to select.
- **Layout Styles**: The color picker can be displayed as a single horizontal row or a multi-line grid via the ``type`` property. This is often automatically adjusted based on whether the picker is in "compact" or "detail" mode.
- **Advanced Selection**: Enable or disable the system's color spectrum/eyedropper with ``supportCustomColor``, and toggle an opacity slider with ``supportOpacity``.

### Usage Example

```swift
let configuration = SPColorPickerConfiguration()
    .spColorPickerColors([.red, .blue, .green])
    .spColorPickerLayout(.grid, spacing: 10)
    .spColorPickerSupportsCustomColor(true)
    .spColorPickerSupportsOpacity(false)
```

## Topics

### Core Properties
Essential settings for the color picker.

- ``SymbolPicker/SPColorPickerConfiguration/colors``
- ``SymbolPicker/SPColorPickerConfiguration/type``
- ``SymbolPicker/SPColorPickerConfiguration/spacing``

### Support Features
Enable or disable advanced color selection options.

- ``SymbolPicker/SPColorPickerConfiguration/supportCustomColor``
- ``SymbolPicker/SPColorPickerConfiguration/supportOpacity``

### Modification Methods
Chainable methods for updating configuration properties.

- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerEnabled(_:)``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerColors(_:)-([CKColor])``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerColors(_:)-(CKColor...)``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerLayout(_:spacing:)``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerSupportsOpacity(_:)``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerSupportsCustomColor(_:)``
