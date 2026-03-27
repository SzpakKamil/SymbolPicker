# ``SymbolPicker/SPSelection/SelectionType/color``

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

A selection type for color values.

## Overview

Setting the `type` of an ``SymbolPicker/SPSelection`` to `.color` activates the ``SymbolPicker/SPSelection/color`` property. This turns the picker into a color selection tool.

### Data Handling

- The `color` property holds the active `CKColor`.
- The `asView()` method renders the color as a circle.
- The system encodes color selections directly for persistence.

### UI Integration

SymbolPicker displays a color selection interface for this type. Users choose from palettes or open a custom color picker.
