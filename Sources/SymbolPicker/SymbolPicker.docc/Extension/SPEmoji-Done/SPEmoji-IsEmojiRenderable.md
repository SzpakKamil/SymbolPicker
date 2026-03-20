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

Verifies if the system's emoji font can render a specific string.

## Overview

The `isEmojiRenderable(_:)` method is a static utility that performs a deep inspection of the system's emoji font.

### Core Logic

Using the `CoreText` framework, the method:
1. Creates an attributed string with the "AppleColorEmoji" font.
2. Resolves the `CTLine` and its component `CTRun` objects for the string.
3. Inspects the glyphs for the string. If any component is a missing glyph (index `0`), the emoji is considered non-renderable.

### Caching

To ensure smooth performance when the `SymbolPicker` is displaying thousands of emojis, this method uses an internal `NSCache` (`availabilityCache`) to store results. Subsequent checks for the same string are fulfilled in constant time.
