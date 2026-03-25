# ``SymbolPicker/SPSelection/init(systemName:colorValues:)``

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

Initializes a selection with a system symbol name and an array of color component values.

- Parameters:
  - systemName: The SF Symbol name to use for the selection.
  - colorValues: An optional array of `Double` values representing RGBA or RGB components.

## Overview

This initializer provides a way to create a symbol selection when color data is stored as raw numeric values, common in persistence layers or network responses.

### Color Reconstruction

The provided `colorValues` array is converted into a `ColorKit/CKColor`:
- If 4 values are provided, they are interpreted as Red, Green, Blue, and Alpha.
- If 3 values are provided, they are interpreted as Red, Green, and Blue.

### Fallback Behavior

If the provided array is empty or does not have a valid length (3 or 4), the selection is created with the symbol only and no tint color is applied.
