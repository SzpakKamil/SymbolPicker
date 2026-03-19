# ``SymbolPicker/SPEmoji/Skin``

Represents a specific skin tone variation of an emoji.

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

## Overview

The `Skin` structure is a nested type within `SPEmoji` that encapsulates data for a specific skin tone variant of the base emoji. It is primarily used when an emoji supports multiple skin tones, allowing the user to select and render a specific variation.

### Purpose

When an `SPEmoji` has `skins`, this array contains `Skin` instances corresponding to the standard Fitzpatrick skin types (e.g., Light, Medium-Light, Medium, Medium-Dark, Dark). The parent `SPEmoji` manages the currently selected `tone`, which maps to an index in this array.

### Properties

- **id**: The unique hexcode string for this specific skin tone variant (e.g., "1F44B-1F3FB").
- **annotation**: A localized description if available.
- **version**: The Unicode version required for this specific variant.

### Methods

- **isAvailable()**: Checks if the specific skin tone variant is supported on the current device.
- **emojiString()**: Returns the raw character string for this variant.

## Topics

### Properties

- ``SymbolPicker/SPEmoji/Skin/id``
- ``SymbolPicker/SPEmoji/Skin/annotation``
- ``SymbolPicker/SPEmoji/Skin/version``

### Methods

- ``SymbolPicker/SPEmoji/Skin/isAvailable()``
- ``SymbolPicker/SPEmoji/Skin/emojiString()``

### Conformance

- ``SymbolPicker/SPEmoji/Skin/==(_:_:)``
- ``SymbolPicker/SPEmoji/Skin/hash(into:)``
