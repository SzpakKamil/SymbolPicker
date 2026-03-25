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

This is the primary initializer used when you already have an ``SymbolPicker/SPSymbol`` or another asset conforming to ``SymbolPicker/SPDataAsset``.

### Selection State

When using this initializer:
- The ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/symbol``.
- The ``SymbolPicker/SPSelection/symbol`` property is populated with the provided asset.
- The ``SymbolPicker/SPSelection/color`` property is set to the provided tint color.

### Custom Assets

Because `SPSelection` is generic, this initializer supports any custom symbol type provided by the developer, as long as it conforms to the `SPDataAsset` protocol.
