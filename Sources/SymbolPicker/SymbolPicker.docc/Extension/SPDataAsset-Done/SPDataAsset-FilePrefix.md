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

The base name for bundle data files.

## Overview

The `filePrefix` static property sets the file naming convention. If you set it to "symbols," the system looks for `symbols_en.json` or `symbols_pl.json`.

### Localization

`filePrefix` is required for localized fetching. ``SymbolPicker/SPDataManager`` combines this prefix with the user's locale to find the correct JSON resource.

### Caching

The data manager uses `filePrefix` for cache keys. This keeps symbols separate from emojis in the cache.

### Metadata

The `SPDataAsset` extension uses the prefix to find:
- `localizationPrefix`: Supported locales for the asset type.
- `resolvedLocalePrefix`: The successfully loaded locale.
