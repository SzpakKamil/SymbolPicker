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

Initialize an image selection using numeric color components. This initializer is useful for data from persistence layers or network responses where colors are stored as raw values.

### Color Reconstruction

The `colorValues` array converts to a `ColorKit/CKColor`. Four values represent RGBA (Red, Green, Blue, Alpha), while three represent RGB. This conversion ensures that your stored numeric data becomes a usable SwiftUI color.

### Selection State

This method sets the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/image``. It also populates the ``SymbolPicker/SPSelection/image`` property with the provided asset.
