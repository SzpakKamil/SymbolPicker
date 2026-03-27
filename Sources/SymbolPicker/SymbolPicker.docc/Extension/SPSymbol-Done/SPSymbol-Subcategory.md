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

A granular group within a main category.

## Overview

The `subcategory` property provides a specific classification beyond the top-level ``SymbolPicker/SPSymbol/category``. For example, the "Weather" category uses subcategories like "Cloudy" or "Precipitation."

### Organization

Subcategories help you organize large numbers of symbols. They enable precise filtering and a refined browsing experience. The picker uses this metadata to group related icons, making it easier for users to navigate the library.

### Metadata

Combined with `category` and `tags`, `subcategory` builds the rich metadata for `SPSymbol`. This information turns a simple system name into a searchable and organized asset.
