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

Indicates that the selection is a pure color value.

## Overview

When the `type` of an ``SymbolPicker/SPSelection`` is set to `.color`, the selection logic uses the ``SymbolPicker/SPSelection/color`` property. This allows the picker to function as a pure color selection tool.

### Data Handling

In this state:
- The `color` property contains the active color (e.g., `ColorKit/CKColor`).
- The `asView()` method renders the color as a simple circular fill.
- Pure color selections are encoded directly to ensure persistence.

### UI Integration

The `SymbolPicker` provides a color selection interface when this type is active, allowing users to choose from predefined palettes or use a custom color picker.
