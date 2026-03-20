# ``SymbolPicker/SPEmoji/tone``

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

An index representing the currently selected skin variation.

## Overview

The `tone` property tracks the active variation of the emoji.

### Index Mapping

- **Value `0`**: Represents the default variation (usually the yellow-skinned version).
- **Values `1` through `n`**: Corresponds to the elements in the ``SymbolPicker/SPEmoji/skins`` array.

### Persistence

Because `tone` is a standard `Int` property of the `Codable` `SPEmoji` struct, any selection made by the user is automatically preserved when the `SPSelection` object is saved.
