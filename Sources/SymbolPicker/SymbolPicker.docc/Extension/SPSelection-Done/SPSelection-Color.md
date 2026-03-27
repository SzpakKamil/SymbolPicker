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

The color for the current selection.

## Overview

The `color` property changes behavior based on the selection ``SymbolPicker/SPSelection/type``.

1. **Active Content**: When the type is ``SymbolPicker/SPSelection/SelectionType/color``, this property holds the selection itself.
2. **Tint and Foreground**: When the type is `symbol`, `emoji`, or `image`, this property tints the asset.

### Data Format

The property uses `CKColor` from ColorKit. This type ensures colors render the same way on iOS, macOS, and other Apple platforms.

### Data Access

The property is `private(set)`. Change its value through the ``SymbolPicker/SPSelection/setColor(_:)` method to keep the state predictable.

### Codable Logic

SymbolPicker stores this property under the `color` key for `.color` types. For other types, it uses the `tint` key. The decoder uses these keys to restore the color correctly.
