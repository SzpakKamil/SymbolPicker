# ``SymbolPicker/SPSelection/setSymbol(_:)``

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

Updates the selection to a new symbol asset.

- Parameter symbol: The new asset of the generic `DataAsset` type (typically ``SymbolPicker/SPSymbol``).

## Overview

The `setSymbol(_:)` method switches the current ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/symbol`` and updates the underlying symbol data.

### Mutating State

When this method is called:
- The ``SymbolPicker/SPSelection/type`` is set to `.symbol`.
- The ``SymbolPicker/SPSelection/symbol`` property is updated with the new asset.
- Any existing emoji or custom image data is cleared by setting those properties to `nil`.

### Generic Compatibility

Since `SPSelection` is generic over its symbol data type, this method accepts any value that matches the generic parameter `DataAsset` (which must conform to ``SymbolPicker/SPDataAsset``).
