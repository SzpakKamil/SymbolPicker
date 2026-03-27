# ``SymbolPicker/SPColorPickerConfiguration``

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

Configures the color picker.

## Overview

`SPColorPickerConfiguration` sets the colors, layout, and features for the embedded color picker.

### Integration

The ``SymbolPicker/SPColorPicker`` view uses this configuration to render the interface.

- **Palette**: The ``colors`` property sets the list of choices.
- **Layouts**: Switch between rows and grids with the ``type`` property.
- **Features**: Use ``supportCustomColor`` for the system eyedropper and ``supportOpacity`` for transparency controls.

### Example

```swift
let configuration = SPColorPickerConfiguration()
    .spColorPickerColors([.red, .blue, .green])
    .spColorPickerLayout(.grid, spacing: 10)
    .spColorPickerSupportsCustomColor(true)
    .spColorPickerSupportsOpacity(false)
```

## Topics

### Core Properties
- ``SymbolPicker/SPColorPickerConfiguration/colors``
- ``SymbolPicker/SPColorPickerConfiguration/type``
- ``SymbolPicker/SPColorPickerConfiguration/spacing``

### Support Features
- ``SymbolPicker/SPColorPickerConfiguration/supportCustomColor``
- ``SymbolPicker/SPColorPickerConfiguration/supportOpacity``

### Modification Methods
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerEnabled(_:)``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerColors(_:)-([CKColor])``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerColors(_:)-(CKColor...)``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerLayout(_:spacing:)``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerSupportsOpacity(_:)``
- ``SymbolPicker/SPColorPickerConfiguration/spColorPickerSupportsCustomColor(_:)``

### Nested Types
- ``SymbolPicker/SPColorPickerConfiguration/Direction``
