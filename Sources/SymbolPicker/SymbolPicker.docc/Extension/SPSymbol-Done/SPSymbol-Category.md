# ``SymbolPicker/SPSymbol/category``

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

The top-level grouping used for organization in the picker.

## Overview

The `category` property provides a high-level classification for the symbol (e.g., "Weather", "Objects", "Devices"). This metadata is used by the `SymbolPicker` to organize symbols into logical groups, making it easier for users to browse and discover relevant assets.

### Organizational Role

In the `SymbolPicker` UI, categories often correspond to sections or tabs, allowing for a structured navigation experience. While SF Symbols are provided by Apple in specific categories, this property allows the package to maintain that same organizational structure.

### Optionality

This property is optional (`String?`). If a symbol does not belong to a specific category, it may be placed in a "General" or "Miscellaneous" group during the rendering process.
