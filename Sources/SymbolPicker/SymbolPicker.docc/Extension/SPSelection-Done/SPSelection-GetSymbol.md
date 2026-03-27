# ``SymbolPicker/SPSelection/getSymbol()``

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

Returns the symbol asset for the selection.

- Returns: The asset of the generic `DataAsset` type (typically ``SymbolPicker/SPSymbol``) assigned to the selection, or `nil` if the selection type is not `.symbol`.

## Overview

Access the symbol asset for a selection. The `getSymbol()` method returns the underlying symbol data if the selection ``SymbolPicker/SPSelection/type`` is `.symbol`. 

### Safe Data Access

This method ensures you only receive a symbol asset when the selection type matches. If the selection is an emoji or a color, it returns `nil`. Because `SPSelection` is generic, the method returns the `DataAsset` type (usually ``SymbolPicker/SPSymbol``), ensuring type safety throughout your project.
