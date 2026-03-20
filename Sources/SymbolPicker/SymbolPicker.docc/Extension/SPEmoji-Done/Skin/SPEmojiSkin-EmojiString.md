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

Returns the literal emoji character(s) represented by the skin variation's hexcode.

## Overview

The `emojiString()` method is the core mechanism for resolving the literal Unicode character (glyph) for a specific variation.

### Glyph Resolution Logic

The method resolves the emoji string directly from the ``SymbolPicker/SPEmoji/Skin/id`` (hexcode) of the variation. This hexcode represents the precise combination of scalars required for the modified glyph.

### Encoding Details

Under the hood, this method converts the hexcode string into its Unicode scalar components and returns a standard Swift `String`. This ensures that even complex multi-scalar emojis (like skin-toned gestures or gendered variations) are correctly reconstructed:
- **Base Scalar**: The primary emoji glyph.
- **Fitzpatrick Modifier**: The skin tone scalar (if applicable).
- **Variation Selector**: Scalars that specify the presentation style (text vs. emoji).
- **Zero Width Joiner (ZWJ)**: Scalars used to combine multiple emojis into a single glyph (e.g., family groups).

### Performance

This method is highly optimized for performance, enabling the `SymbolPicker` to render thousands of emoji variations in a smooth, scrolling grid. The conversion process is fast and efficient, ensuring zero impact on the UI responsiveness.
