# ``SymbolPicker/SPDataAsset/fetchAssets(locale:)``

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

Asynchronously loads and decodes the assets from the app bundle for a specific locale, supporting SF Symbols, Emojis, and custom icons.

- Parameter locale: A string representing the locale (e.g., "en", "pl").
- Returns: An array of assets that are available on the current OS.

## Overview

The `fetchAssets(locale:)` method is the primary way that assets are loaded into the system. This method is called by the ``SymbolPicker/SPDataManager`` when it needs to populate the picker with assets for a specific type.

### Implementation Requirements

A type conforming to `SPDataAsset` must implement this method to:
- Construct the resource URL using its ``SymbolPicker/SPDataAsset/filePrefix`` and the provided locale string.
- Load the contents of the JSON file from the bundle.
- Decode the JSON data into an array of the conforming type.
- Filter the results using ``SymbolPicker/SPDataAsset/isAvailable()`` to ensure that only supported assets are returned.

### Asynchronous Operations

Loading and decoding large asset files (especially for emojis) can be computationally intensive. By making this method `async`, the `SPDataManager` can perform these operations in the background, keeping the main thread responsive for UI interactions.

### Fallback Behavior

Typically, this method should also include fallback logic (e.g., defaulting to "en" if the requested locale's file is missing) to ensure that the picker always has content to display.
