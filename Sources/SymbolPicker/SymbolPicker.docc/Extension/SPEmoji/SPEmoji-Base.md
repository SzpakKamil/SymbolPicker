# ``SymbolPicker/SPEmoji``

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

A data-driven model representing a Unicode emoji with metadata, skin tone variants, and platform-aware availability checks.

## Overview

`SPEmoji` is the foundational structure used to manage and render emojis within the `SymbolPicker` package. It conforms to ``SymbolPicker/SPDataAsset``, allowing it to be managed by ``SymbolPicker/SPDataManager`` and displayed alongside symbols in a unified picker experience.

Beyond storing a hexcode identifier, `SPEmoji` provides a robust system for:
- **Tone Variants**: Supports skin tone selections via the ``SymbolPicker/SPEmoji/skins`` array and the current ``SymbolPicker/SPEmoji/tone`` index.
- **Platform Safety**: Validates emoji support at runtime using OS version and renderability checks to avoid missing glyphs.
- **Searchability**: Includes localized annotations and tags for semantic search (e.g., searching "smile" finds the correct emoji).
- **Localization**: Loads translated metadata from locale-specific JSON resources.

### Data Management

Emojis are loaded from localized JSON files bundled with the package. The static ``SymbolPicker/SPEmoji/fetchAssets(locale:)`` method resolves the correct resource and filters the results by availability.

## Topics

### Skin Variants

- ``SymbolPicker/SPEmoji/Skin``
- ``SymbolPicker/SPEmoji/skins``
- ``SymbolPicker/SPEmoji/tone``
- ``SymbolPicker/SPEmoji/emojiString()``

### Asset Properties

- ``SymbolPicker/SPEmoji/id``
- ``SymbolPicker/SPEmoji/annotation``
- ``SymbolPicker/SPEmoji/version``
- ``SymbolPicker/SPEmoji/category``
- ``SymbolPicker/SPEmoji/subcategory``
- ``SymbolPicker/SPEmoji/tags``

### Initialization

- ``SymbolPicker/SPEmoji/init(_:)``
- ``SymbolPicker/SPEmoji/init(id:version:category:annotation:subcategory:tags:skins:tone:)``

### Platform & Validation

- ``SymbolPicker/SPEmoji/isAvailable()``
- ``SymbolPicker/SPEmoji/isEmojiRenderable(_:)``

### Data Management

- ``SymbolPicker/SPEmoji/fetchAssets(locale:)``
- ``SymbolPicker/SPEmoji/filePrefix``

### Rendering

- ``SymbolPicker/SPEmoji/asView()``
