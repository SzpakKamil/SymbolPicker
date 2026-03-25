# ``SymbolPicker/SPSelection/init(image:colorValues:)``

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

Initializes a selection with a custom image and an array of color component values.

- Parameters:
  - image: The ``SymbolPicker/SPImage`` to use as the selection.
  - colorValues: An optional array of `Double` values representing RGBA or RGB components.

## Overview

This initializer provides a way to create an image selection when color data is stored as raw numeric values, common in persistence layers or network responses.

### Color Reconstruction

The provided `colorValues` array is converted into a `ColorKit/CKColor`:
- If 4 values are provided, they are interpreted as Red, Green, Blue, and Alpha.
- If 3 values are provided, they are interpreted as Red, Green, and Blue.

### Selection State

When using this initializer:
- The ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/image``.
- The ``SymbolPicker/SPSelection/image`` property is populated with the provided asset.
