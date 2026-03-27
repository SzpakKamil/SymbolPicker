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

The index of the selected skin variation.

## Overview

The `tone` property tracks the active variation for an emoji.

### Index Values

- **`0`**: The default version, usually yellow.
- **`1` to `n`**: Items in the ``SymbolPicker/SPEmoji/skins`` array.

### Persistence

Since `tone` is an `Int` in the `Codable` emoji struct, the system saves your selection automatically when you store an `SPSelection` object.
