# ``SymbolPicker/SPDataAsset/filePrefix``

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

The base name used to identify the data files in the bundle, supporting SF Symbols, Emojis, and custom icons.

## Overview

The `filePrefix` is a static property that determines the file naming convention for a conforming asset type. For example, if a type's `filePrefix` is "symbols", the system looks for files named `symbols_en.json`, `symbols_pl.json`, etc.

### Resource Localization

The `filePrefix` is essential for localized data fetching. The ``SymbolPicker/SPDataManager`` uses this prefix along with the user's current locale to locate and load the corresponding JSON resource.

### Cache Keys

In addition to identifying file names, the `filePrefix` is used as a base for cache keys within the data manager. This ensures that assets are cached separately for different types (e.g., symbols are cached independently of emojis).

### Computed Metadata

The protocol extension for `SPDataAsset` uses `filePrefix` to derive other useful strings:
- `localizationPrefix`: used to store the list of supported locales for a specific asset type.
- `resolvedLocalePrefix`: used to store the specific locale that was successfully resolved and loaded for an asset type.
