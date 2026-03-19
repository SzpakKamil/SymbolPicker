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

A data-driven model representing an Apple SF Symbol with enhanced metadata, variant support, and platform-specific availability logic.

## Overview

`SPSymbol` is the foundational structure used to manage and render SF Symbols within the `SymbolPicker` package. It conforms to ``SymbolPicker/SPDataAsset``, allowing it to be managed by ``SymbolPicker/SPDataManager`` and displayed in a grid.

Beyond being a simple wrapper for a system name string, `SPSymbol` provides a robust architectural solution for:
- **Variant Consistency**: Tracks corresponding "filled" and "outlined" icons, ensuring that users can switch styles globally while maintaining their current selection.
- **Platform Safety**: Verifies symbol existence at runtime to prevent crashes or empty placeholders on older OS versions.
- **Searchability**: Includes localized annotations and tags for semantic search (e.g., searching "love" finds "heart").
- **Localization**: Supports fetching translated metadata based on the user's locale.

### Data Management

Symbols are typically loaded from localized JSON resources included in the package bundle. The static ``SymbolPicker/SPSymbol/fetchAssets(locale:)`` method orchestrates this process, including resource resolution and automatic availability filtering.

### Integration with SPSelection

When a user interacts with the `SymbolPicker`, the `SPSymbol` is typically wrapped in an ``SymbolPicker/SPSelection`` object. Because `SPSymbol` is `Codable`, selections can be easily persisted to `UserDefaults` or other storage.

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
