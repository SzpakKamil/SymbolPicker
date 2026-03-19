# ``SymbolPicker/SPSymbol/subcategory``

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

A granular grouping for further organizational detail within a category.

## Overview

The `subcategory` property offers a more specific classification than the top-level ``SymbolPicker/SPSymbol/category``. For example, within the "Weather" category, a symbol might have a subcategory like "Cloudy" or "Precipitation".

### Fine-Grained Organization

Subcategories allow the `SymbolPicker` to provide a deeper level of organization, which is particularly useful when dealing with a large number of symbols in a single category. It enables more precise filtering and a more refined browsing experience.

### Metadata Enrichment

Together with `category` and `tags`, `subcategory` forms part of the rich metadata that makes `SPSymbol` more than just a simple wrapper around a system name.
