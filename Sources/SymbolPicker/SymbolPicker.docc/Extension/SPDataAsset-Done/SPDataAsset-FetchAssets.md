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

Loads and decodes assets from the app bundle for a specific locale.

- Parameter locale: The locale string like "en" or "pl".
- Returns: An array of assets supported by the current OS.

## Overview

`fetchAssets(locale:)` loads assets into the system. ``SymbolPicker/SPDataManager`` calls this method to fill the picker with items.

### Implementation Requirements

Conforming types must:
- Create the resource URL using ``SymbolPicker/SPDataAsset/filePrefix`` and the locale.
- Load the JSON file from the bundle.
- Decode the data into an array.
- Filter the list with ``SymbolPicker/SPDataAsset/isAvailable()``.

### Performance

Loading and decoding large files takes work. Using `async` and `nonisolated` for this method lets the data manager stay responsive by running heavy tasks in the background.

### Fallback

The method should default to "en" if it cannot find the requested locale file. This ensures the picker always shows content to the user.
