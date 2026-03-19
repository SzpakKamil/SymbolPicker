# ``SymbolPicker/SPSymbol/filePrefix``

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

A static property used by `SPDataManager` to locate localized JSON files.

## Overview

The `filePrefix` static property defines the base name for the JSON resource files that contain the symbol data (e.g., "symbols").

### Resource Resolution

When ``SymbolPicker/SPSymbol/fetchAssets(locale:)`` is called, it uses this prefix to construct the full filename of the resource to load, such as `symbols_en.json`. This allows the package to support multiple languages and regions by simply adding new JSON files with the appropriate suffix.

### Consistency

By centralizing the file naming convention in this property, the package ensures that the data loading logic remains consistent and easy to maintain, even if the underlying resource names need to be changed in the future.
