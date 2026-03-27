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

A specific classification within the primary category.

## Overview

The `subcategory` property offers a second level of organization beyond the primary ``SymbolPicker/SPDataAsset/category``.

### Organization

Inside a "Nature" category, you might use subcategories like:
- "Animals"
- "Weather"
- "Plants"

Subcategories help you find assets faster when navigating large collections.

### Search

The default `matches(_:)` implementation checks the `subcategory`. Search results include all assets in a subcategory if the query matches the subcategory name.

### Implementation

Subcategories create a more structured experience. In ``SymbolPicker/SPSymbol``, the subcategory often comes from system metadata.
