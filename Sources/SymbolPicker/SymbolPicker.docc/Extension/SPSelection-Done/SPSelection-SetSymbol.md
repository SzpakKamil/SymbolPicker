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

Update the selection to a new symbol asset. The `setSymbol(_:)` method changes the selection ``SymbolPicker/SPSelection/type`` to ``SymbolPicker/SPSelection/SelectionType/symbol`` and refreshes the symbol data.

### Mutating State

This method clears any existing emoji or custom image data by setting those properties to `nil`. It updates the ``SymbolPicker/SPSelection/symbol`` property with the new asset.

### Generic Compatibility

Since `SPSelection` is generic, this method accepts any asset that conforms to ``SymbolPicker/SPDataAsset``. This ensures that your custom symbol types work correctly with the standard selection logic.
