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

The `getSymbol()` method provides safe access to the underlying symbol data. It ensures that you only receive a symbol asset if the selection ``SymbolPicker/SPSelection/type`` is currently set to `.symbol`.

### Generic Return Type

Since `SPSelection` is generic over its asset data, this method returns a value of the `DataAsset` type, which is typically ``SymbolPicker/SPSymbol``. This ensures type safety throughout your codebase.
