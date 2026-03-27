# ``SymbolPicker/SPSelectionProtocol/getColor()``

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

Gets the color for the current selection.

- Returns: A `CKColor` if a color exists. Otherwise, returns `nil`.

## Overview

The `getColor()` method provides a standard way to read the color of any user selection. Use this to display or change the color component, whether the selection is a symbol with a tint or a solid color choice.

### Use Cases

- **Color Pickers**: ``SymbolPicker/SPColorPicker`` uses this to find the current selection and highlight the correct cell.
- **Previews**: Preview views use this to tint symbols or show color blocks.
- **Styling**: Host apps use this to theme their UI based on the user's choice.
