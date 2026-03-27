# ``SymbolPicker/SPEmoji/Skin``

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

A model for emoji variations like skin tones or gender.

## Overview

The `Skin` struct manages variations for an emoji. While ``SymbolPicker/SPEmoji`` represents the base asset, `Skin` defines the specific renderable forms supported by Unicode.

### Implementation

`SPEmoji.Skin` ensures data integrity and visual accuracy:
- **Mapping**: Links base emojis to modifier scalars.
- **Availability**: Tracks Unicode versions for each variation.
- **Metadata**: Provides localized labels to improve accessibility.

### Selection Workflow

If an emoji supports variations, the ``SymbolPicker/SPEmoji/skins`` array contains the data. The picker UI shows these options, often during a long-press. When you pick a variation, the system updates the ``SymbolPicker/SPEmoji/tone`` index. The ``SymbolPicker/SPEmoji/asView()`` method then renders the correct glyph.

### Persistence

The `Skin` struct follows the `Codable` protocol. SymbolPicker saves your skin tone choice within the parent emoji instance to restore the state later.

## Topics

### Asset Properties

- ``SymbolPicker/SPEmoji/Skin/id``
- ``SymbolPicker/SPEmoji/Skin/annotation``
- ``SymbolPicker/SPEmoji/Skin/version``

### Initialization

- ``SymbolPicker/SPEmoji/Skin/init(id:annotation:version:)``

### Platform & Validation

- ``SymbolPicker/SPEmoji/Skin/isAvailable()``

### Glyph Resolution

- ``SymbolPicker/SPEmoji/Skin/emojiString()``
