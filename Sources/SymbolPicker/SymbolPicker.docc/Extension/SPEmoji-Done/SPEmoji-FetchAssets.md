# ``SymbolPicker/SPEmoji/fetchAssets(locale:)``

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

Loads and filters emojis for a locale.

## Overview

The `fetchAssets(locale:)` method builds the emoji library for SymbolPicker. This asynchronous process handles loading, decoding, and filtering.

### Pipeline Steps

1. **Resolution**: Searches the bundle for a JSON file like `emojis_[locale].json`. If the locale is missing, it uses English (`"en"`) as a fallback.
2. **Decoding**: Converts the file data into an array of `SPEmoji` objects.
3. **Filtering**: Runs ``SymbolPicker/SPEmoji/isAvailable()`` on every item. The method removes any emoji the current device cannot render.

### Implementation

``SymbolPicker/SPDataManager`` calls this method when initializing or changing the picker language. Because it runs in the background, your app's UI stays responsive during the load.
