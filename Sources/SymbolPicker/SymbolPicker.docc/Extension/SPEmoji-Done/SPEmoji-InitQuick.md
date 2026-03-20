# ``SymbolPicker/SPEmoji/init(_:)``

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

Creates a new emoji instance from a literal string or hexcode.

## Overview

The `init(_:)` initializer provides a quick and flexible way to create an `SPEmoji` wrapper from a string. It can handle both literal emoji characters and their hexcode representations.

### Input Handling

1. **Hexcode Strings**: If the input string matches a hexcode pattern (e.g., `"1F600"`), it is used directly as the ``SymbolPicker/SPEmoji/id``.
2. **Literal Emojis**: If the input is a literal emoji character (e.g., `"🍎"`), the initializer converts its underlying Unicode scalars into a hyphenated hexcode string for the identifier.

### Defaults

When created via this initializer:
- **``SymbolPicker/SPEmoji/version``**: Defaults to `1.0`.
- **Metadata (Annotation, Tags, Categories)**: Initialized as `nil`.
- **Variations (Skins)**: Initialized as `nil`.
- **Current Tone**: Defaults to `0`.

### Usage

This initializer is ideal for ad-hoc emoji creation in code where full catalog metadata is not required.
