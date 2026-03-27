# ``SymbolPicker/SPEmoji/Skin/emojiString()``

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

Returns the emoji character for the skin variation.

## Overview

The `emojiString()` method resolves the literal Unicode character from the variation's hexcode.

### Logic

The method uses the ``SymbolPicker/SPEmoji/Skin/id`` to find the scalars required for the modified glyph. It converts the hexcode string into scalar components and returns a Swift `String`.

### Components

This process handles various Unicode scalars:
- **Base**: The primary emoji.
- **Modifier**: Skin tone scalars.
- **Selector**: Presentation style scalars.
- **Joiner**: Scalars that combine emojis into one glyph, like family groups.

### Performance

SymbolPicker uses an optimized conversion process. This allows the grid to render thousands of variations without lagging.
