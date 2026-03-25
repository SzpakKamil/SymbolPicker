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

When the selection ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/symbol``, this property contains the active asset data.

### Generic Asset Support

`SPSelection` is generic over any type that conforms to `SPDataAsset`. In most scenarios, this will be ``SymbolPicker/SPSymbol``. This allows developers to use custom symbol types if necessary while maintaining all picker functionality.

### Data Access

While this property can be accessed directly, it is often better to use the ``SymbolPicker/SPSelection/getSymbol()`` method for a consistent interface that works alongside other asset types.

### Interaction with Color

If a custom color is set via ``SymbolPicker/SPSelection/color``, it will be applied to the symbol during rendering (e.g., as a tint or foreground color).
