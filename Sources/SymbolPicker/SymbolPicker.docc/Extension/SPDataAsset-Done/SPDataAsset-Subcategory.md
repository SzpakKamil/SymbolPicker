# ``SymbolPicker/SPDataAsset/subcategory``

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

A more specific classification within the primary category, supporting SF Symbols, Emojis, and custom icons.

## Overview

The `subcategory` property provides a secondary level of classification for an asset, enabling more precise organization and filtering than the primary ``SymbolPicker/SPDataAsset/category`` alone.

### Granular Organization

Within a category like "Nature", subcategories can be used to further refine the grouping:
- "Animals"
- "Weather"
- "Plants"

This property allows the user to find assets more quickly by drilling down through a hierarchical structure, which is especially useful when a single category contains a large number of assets.

### Search Refinement

The `subcategory` property is included in the default implementation of ``SymbolPicker/SPDataAsset/matches(_:)``. If a user's search query matches a subcategory name, all assets within that subcategory will be returned.

### Implementation

While the `subcategory` is optional, it is a powerful tool for building a more structured and professional picker experience. In types like ``SymbolPicker/SPSymbol``, the subcategory is often derived from the symbol's name or its associated system metadata.
