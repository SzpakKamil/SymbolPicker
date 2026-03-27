# ``SymbolPicker/SPSelection/init(symbol:color:)``

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

Initializes a selection with a symbol asset and an optional tint color.

- Parameters:
  - symbol: The asset of the generic `DataAsset` type (typically ``SymbolPicker/SPSymbol``).
  - color: An optional `ColorKit/CKColor` to apply as a tint. Defaults to `nil`.

## Overview

Initialize a selection with a symbol asset and an optional tint color. Use this primary initializer when you have an ``SymbolPicker/SPSymbol`` or another asset that conforms to ``SymbolPicker/SPDataAsset``.

### Selection State

This method sets the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/symbol``. It populates the ``SymbolPicker/SPSelection/symbol`` property with the provided asset and the ``SymbolPicker/SPSelection/color`` property with the tint color.

### Custom Assets

Because `SPSelection` is generic, this initializer supports any custom symbol type you provide. This flexibility allows developers to extend the library with their own asset models while maintaining compatibility with the standard selection logic.
