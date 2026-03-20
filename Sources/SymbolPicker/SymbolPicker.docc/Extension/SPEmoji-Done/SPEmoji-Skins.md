# ``SymbolPicker/SPEmoji/skins``

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

An optional array of skin variations for the emoji.

## Overview

The `skins` property contains an array of ``SymbolPicker/SPEmoji/Skin`` objects, each representing a specific variation (e.g., different Fitzpatrick skin tones) supported by the Unicode standard for this emoji.

### Dynamic Rendering

When this array is non-nil, the `SymbolPicker` can offer a skin tone selector. The current selection is tracked by the ``SymbolPicker/SPEmoji/tone`` property.
