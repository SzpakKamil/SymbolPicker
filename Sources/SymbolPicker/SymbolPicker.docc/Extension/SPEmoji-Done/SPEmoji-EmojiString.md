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

Returns the literal emoji character(s) represented by the emoji's hexcode and current tone selection.

## Overview

The `emojiString()` method is responsible for resolving the literal Unicode character (glyph) to be displayed to the user. This resolution depends on the ``SymbolPicker/SPEmoji/tone`` index.

### Glyph Resolution Logic

1. **Default Tone (`0`)**: If the current tone index is `0`, the method resolves the emoji string directly from the base ``SymbolPicker/SPEmoji/id`` (hexcode). This is typically the default (e.g., yellow) version of an emoji.
2. **Skin Variations (`1` to `n`)**: If the current tone index is greater than `0`, the method attempts to resolve the glyph from the corresponding ``SymbolPicker/SPEmoji/Skin`` in the ``SymbolPicker/SPEmoji/skins`` array. If the index is within bounds, the hexcode of that skin is used.

### Encoding Details

Under the hood, this method converts the hexcode string (e.g., `"1F600"`) into its Unicode scalar components and returns a standard Swift `String`. This ensures that even complex multi-scalar emojis (like flags or skin-toned gestures) are correctly reconstructed.
