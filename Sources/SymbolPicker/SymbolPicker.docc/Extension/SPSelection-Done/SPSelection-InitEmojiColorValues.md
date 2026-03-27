# ``SymbolPicker/SPSelection/init(emoji:colorValues:)``

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

Initializes a selection with an emoji and an array of color component values.

- Parameters:
  - emoji: The ``SymbolPicker/SPEmoji`` to use as the selection.
  - colorValues: An optional array of `Double` values representing RGBA or RGB components.

## Overview

Initialize an emoji selection with raw numeric color values. This initializer supports data from persistence layers or network responses where colors are stored as simple arrays of numbers.

### Color Reconstruction

The `colorValues` array converts to a `ColorKit/CKColor`. Four values represent RGBA (Red, Green, Blue, Alpha), while three represent RGB. This process ensures your stored numeric data becomes a valid tint or background color for the emoji.

### Selection State

This method sets the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/emoji``. It also populates the ``SymbolPicker/SPSelection/emoji` property with your character data.
