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

A model for Unicode emojis with metadata and skin tone support.

## Overview

`SPEmoji` manages and renders emojis in SymbolPicker. It follows the ``SymbolPicker/SPDataAsset`` protocol, so it works alongside symbols in the unified picker.

### Features

- **Skin Tones**: Uses the ``SymbolPicker/SPEmoji/skins`` array and the ``SymbolPicker/SPEmoji/tone`` index to show variations.
- **Platform Safety**: Checks OS versions and font support at runtime to prevent broken glyphs.
- **Search**: Includes localized labels and tags for finding assets by name.
- **Localization**: Loads metadata from locale-specific JSON files.

### Data Management

The system loads emojis from JSON resources bundled with the app. The ``SymbolPicker/SPEmoji/fetchAssets(locale:)`` method handles this process and filters the results for the current device.

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
