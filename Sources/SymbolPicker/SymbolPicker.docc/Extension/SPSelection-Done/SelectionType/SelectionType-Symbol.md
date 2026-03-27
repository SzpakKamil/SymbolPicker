# ``SymbolPicker/SPSelection/SelectionType/symbol``

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

A selection type for SF Symbols and vector assets.

## Overview

Setting the `type` of an ``SymbolPicker/SPSelection`` to `.symbol` activates the ``SymbolPicker/SPSelection/symbol`` property. This is the standard selection type for most use cases.

### Data Handling

- The `symbol` property holds the ``SymbolPicker/SPSymbol`` asset.
- The `asView()` method uses ``SymbolPicker/SPSymbolView`` for rendering.
- The system encodes the symbol data with the selection type for persistence.

### UI Integration

SymbolPicker displays the symbol browser for this type. Users search and select from thousands of SF Symbols.
