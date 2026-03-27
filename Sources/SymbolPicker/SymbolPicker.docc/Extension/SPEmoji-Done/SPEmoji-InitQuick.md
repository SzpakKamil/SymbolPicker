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

Creates an emoji from a string or hexcode.

## Overview

The `init(_:)` initializer builds an `SPEmoji` wrapper. It accepts literal emoji characters or hexcode strings.

### Handling Inputs

1. **Hexcodes**: If you pass a hexcode string like `"1F600"`, the initializer uses it as the ``SymbolPicker/SPEmoji/id``.
2. **Literals**: If you pass a character like `"🍎"`, the system converts its Unicode scalars into a hyphenated hexcode string.

### Default Values

This initializer sets standard defaults:
- **Version**: Sets to `1.0`.
- **Metadata**: Sets annotation, tags, and categories to `nil`.
- **Variations**: Sets the skins array to `nil`.
- **Tone**: Sets the index to `0`.

### Usage

Use this method for quick emoji creation when you do not need full catalog metadata.
