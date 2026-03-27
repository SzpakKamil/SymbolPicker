# ``SymbolPicker/SPSymbol``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

A model for SF Symbols with metadata and variant support.

## Overview

`SPSymbol` manages and renders SF Symbols in the SymbolPicker package. It follows the ``SymbolPicker/SPDataAsset`` protocol, so ``SymbolPicker/SPDataManager`` can organize and show it in the asset grid.

`SPSymbol` does more than wrap a system name string. It handles:
- **Variants**: Tracks matching "filled" and "outlined" icons. Users can switch styles globally while keeping their selection.
- **Safety**: Verifies if a symbol exists at runtime. This prevents missing icons on older OS versions.
- **Search**: Includes localized annotations and tags. Searching for "love" finds the "heart" symbol.
- **Localization**: Loads translated metadata based on the user's locale.

### Data Management

The system loads symbols from localized JSON files in the package bundle. The ``SymbolPicker/SPSymbol/fetchAssets(locale:)`` method handles resource resolution and availability filtering.

### Selection

SymbolPicker wraps `SPSymbol` in an ``SymbolPicker/SPSelection`` object during user interaction. Since the model is `Codable`, you can save selections to `UserDefaults` or other storage.

## Topics

### Visual Variants

- ``SymbolPicker/SPSymbol/Variant``
- ``SymbolPicker/SPSymbol/variant``
- ``SymbolPicker/SPSymbol/name(for:)``

### Asset Properties

- ``SymbolPicker/SPSymbol/id``
- ``SymbolPicker/SPSymbol/filledName``
- ``SymbolPicker/SPSymbol/notFilled``
- ``SymbolPicker/SPSymbol/annotation``
- ``SymbolPicker/SPSymbol/category``
- ``SymbolPicker/SPSymbol/subcategory``
- ``SymbolPicker/SPSymbol/tags``
- ``SymbolPicker/SPSymbol/version``

### Initialization

- ``SymbolPicker/SPSymbol/init(systemName:)``
- ``SymbolPicker/SPSymbol/init(filledName:notFilled:version:variant:annotation:category:subcategory:tags:)``

### Platform & Validation

- ``SymbolPicker/SPSymbol/isAvailable()``
- ``SymbolPicker/SPSymbol/isDuplicate(of:)``
- ``SymbolPicker/SPSymbol/isSelection(of:)``

### Data Management

- ``SymbolPicker/SPSymbol/fetchAssets(locale:)``
- ``SymbolPicker/SPSymbol/filePrefix``

### Rendering

- ``SymbolPicker/SPSymbol/asView()``
