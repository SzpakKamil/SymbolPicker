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

Indicates that the selection is an SF Symbol or a custom vector asset.

## Overview

When the `type` of an ``SymbolPicker/SPSelection`` is set to `.symbol`, the selection logic focuses on the ``SymbolPicker/SPSelection/symbol`` property. This is the most common selection type in the `SymbolPicker`.

### Data Handling

In this state:
- The `symbol` property contains the active asset (e.g., ``SymbolPicker/SPSymbol``).
- The `asView()` method renders the symbol using its specialized view (e.g., ``SymbolPicker/SPSymbolView``).
- Persistence logic encodes the symbol's data alongside the selection type.

### UI Integration

The `SymbolPicker` displays a symbol browser when this type is active, allowing users to search and select from thousands of available SF Symbols.
