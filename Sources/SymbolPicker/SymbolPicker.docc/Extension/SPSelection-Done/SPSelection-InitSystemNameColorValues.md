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

Initialize a symbol selection using an SF Symbol name and numeric color components. This initializer is useful when color data comes from persistence layers as raw numeric values.

### Color Reconstruction

The `colorValues` array converts to a `ColorKit/CKColor`. Four values represent RGBA (Red, Green, Blue, Alpha), while three represent RGB. This ensures that your stored numeric data becomes a usable tint for the SF Symbol.

### Fallback Behavior

If the array is empty or an invalid length, the library creates the selection with the symbol only. No tint is applied in this case. This allows for resilient data loading even when color information is missing or corrupted in your data source.
