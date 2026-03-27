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

An array of skin variations for the emoji.

## Overview

The `skins` property stores ``SymbolPicker/SPEmoji/Skin`` objects. Each item represents a variation, such as a Fitzpatrick skin tone, supported by Unicode.

### Rendering

If this array contains data, SymbolPicker can show a skin tone selector. The ``SymbolPicker/SPEmoji/tone`` property tracks which variation is active.
