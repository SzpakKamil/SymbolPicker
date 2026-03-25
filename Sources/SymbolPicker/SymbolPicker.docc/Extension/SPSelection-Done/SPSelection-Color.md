# ``SymbolPicker/SPSelection/color``

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

The color associated with the current selection.

## Overview

The `color` property serves two purposes depending on the selection ``SymbolPicker/SPSelection/type``:

1. **Active Content**: When the type is ``SymbolPicker/SPSelection/SelectionType/color``, this property *is* the selection.
2. **Tint/Foreground**: When the type is `symbol`, `emoji`, or `image`, this property acts as a tint or foreground color applied to that asset during rendering.

### Data Format

This property uses `ColorKit/CKColor`, a platform-agnostic color type that provides consistent rendering on iOS, macOS, and other platforms.

### Data Access

This property is private(set), so all modifications must go through the ``SymbolPicker/SPSelection/setColor(_:)`` method. This ensures that the state is managed predictably across the library.

### Codable Logic

When encoded, this property is stored under the `color` key if the selection type is `.color`, or the `tint` key if the selection type is anything else. This allows the decoder to correctly apply the color during restoration.
