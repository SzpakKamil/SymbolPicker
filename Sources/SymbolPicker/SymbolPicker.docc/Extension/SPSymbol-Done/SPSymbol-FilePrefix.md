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

The prefix for localized JSON files.

## Overview

The `filePrefix` static property sets the base name for the JSON resources containing symbol data. It defaults to `"symbols"`.

### Usage

When you call ``SymbolPicker/SPSymbol/fetchAssets(locale:)``, the system uses this prefix to build the filename. For example, it searches for `symbols_en.json`. This naming convention allows the package to support new languages by adding JSON files with the correct suffix. Centralizing this name ensures the loading logic remains consistent and easy to update.
