# ``SymbolPicker/SPEmoji/isEmojiRenderable(_:)``

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

Checks if the system font can display a string.

## Overview

The `isEmojiRenderable(_:)` static utility inspects the system's emoji font.

### Core Logic

The method uses the `CoreText` framework to perform these steps:
1. It builds an attributed string with the "AppleColorEmoji" font.
2. It finds the `CTLine` and `CTRun` objects for that string.
3. It checks the glyph indices. If any component uses index `0` (the missing glyph symbol), the method marks the emoji as non-renderable.

### Performance Caching

Checking font glyphs takes time. To keep SymbolPicker fast, this method stores results in an `NSCache`. If the system asks for the same string again, it returns the cached result instantly. This ensures the picker remains responsive even with thousands of assets.
