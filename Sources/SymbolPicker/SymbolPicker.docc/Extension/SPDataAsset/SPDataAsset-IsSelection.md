# ``SymbolPicker/SPDataAsset/isSelection(of:)``

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

Checks if the current asset matches the one currently selected in the picker, supporting SF Symbols, Emojis, and custom icons.

- Parameter symbol: An asset to compare against.
- Returns: `true` if the current asset is the same as the selection; otherwise, `false`.

## Overview

The `isSelection(of:)` method is primarily used in the UI layer of the `SymbolPicker` package. It helps the system determine which asset in the grid or list should be highlighted as "selected".

### Highlighting Selection

When rendering each cell in the picker, the ``SymbolPicker/SPOptionList`` calls `isSelection(of:)` on the asset. If the method returns `true`, the cell's view can be updated with a specific selection indicator (e.g., a checkmark or a background color).

### Default Implementation

The default implementation provided by the protocol extension uses the `==` operator for comparison. This is the most common behavior for most asset types.

### Specialized Comparison

Some asset types require more sophisticated selection logic. For instance, **SPSymbol** overrides `isSelection(of:)` to consider an asset selected if its current variant (filled or outlined) matches either the filled or outlined name of the provided symbol. This allows the picker to correctly highlight symbols even when the variant is toggled.

### UI State Management

The `isSelection(of:)` method is a key component in maintaining a consistent and responsive selection state within the picker's view hierarchy.
