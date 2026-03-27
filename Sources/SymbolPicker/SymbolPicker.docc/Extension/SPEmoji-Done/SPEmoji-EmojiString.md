# ``SymbolPicker/SPEmoji/emojiString()``

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

Returns the emoji character for the current tone.

## Overview

The `emojiString()` method resolves the literal Unicode character based on the ``SymbolPicker/SPEmoji/tone`` index.

### Resolution

1. **Default (`0`)**: Resolves the string from the base ``SymbolPicker/SPEmoji/id``. This usually returns the default yellow version.
2. **Variations (`1` to `n`)**: Resolves the glyph from the matching ``SymbolPicker/SPEmoji/Skin`` in the ``SymbolPicker/SPEmoji/skins`` array.

### Details

The method converts the hexcode string into Unicode scalar components. This ensures complex emojis, like flags or gestures with skin tones, reconstruct correctly into a Swift `String`.
