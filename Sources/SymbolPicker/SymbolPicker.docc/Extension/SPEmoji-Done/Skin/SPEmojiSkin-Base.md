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

A data-driven model representing a specific variation of an emoji, such as different skin tones or gender modifications.

## Overview

The `Skin` struct is the foundational component for managing emoji variations within the `SymbolPicker` package. While a base ``SymbolPicker/SPEmoji`` represents the generic form of an asset (e.g., "Waving Hand"), the `Skin` struct defines the specific, renderable variations supported by the Unicode standard for that asset.

### Architectural Role

`SPEmoji.Skin` allows the picker to maintain a high degree of data integrity and visual consistency by:
- **Variation Mapping**: Linking base emojis to their specific skin tone or modifier scalars.
- **Granular Availability**: Tracking Unicode versions at the variation level, as some skin tones for specific emojis may have been introduced in different Unicode releases than the base emoji.
- **Localized Metadata**: Providing specific annotations for variations (e.g., "Waving Hand: Light Skin Tone") to improve accessibility and search accuracy.

### Skin Tone Selection Workflow

When an emoji supports variations, the ``SymbolPicker/SPEmoji/skins`` array is populated during the data ingestion phase. The `SymbolPicker` UI utilizes this data to present a variation picker (typically via a long-press gesture). Once a user selects a variation, the ``SymbolPicker/SPEmoji/tone`` index is updated, which in turn causes the ``SymbolPicker/SPEmoji/asView()`` method to resolve and render the corresponding `Skin` glyph.

### Persistence and State

Because `SPEmoji.Skin` conforms to `Codable`, variations are fully persistent. When a user selects a specific skin tone, that choice is encoded within the parent `SPEmoji` instance, allowing for seamless state restoration across app launches.

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
