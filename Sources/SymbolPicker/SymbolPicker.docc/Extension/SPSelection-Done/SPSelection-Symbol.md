# ``SymbolPicker/SPSelection/symbol``

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

The underlying asset of the generic `DataAsset` type (typically ``SymbolPicker/SPSymbol``).

## Overview

The `symbol` property contains the active asset data when the selection ``SymbolPicker/SPSelection/type`` is `.symbol`. 

### Generic Asset Support

`SPSelection` is generic, so this property typically holds an ``SymbolPicker/SPSymbol``. However, it supports any type conforming to ``SymbolPicker/SPDataAsset``. This flexibility lets you use custom symbol models while keeping the picker's core features.

### Data Access and Rendering

While you can access this property directly, ``SymbolPicker/SPSelection/getSymbol()`` provides a more consistent interface. If you set a custom ``SymbolPicker/SPSelection/color``, the library applies it as a tint or foreground color when rendering the symbol. This ensures your chosen style carries over to the UI.
