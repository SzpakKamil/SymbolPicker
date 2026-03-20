# ``SymbolPicker/SPEmoji/asView()``

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

Returns a SwiftUI view that renders the emoji.

## Overview

The `asView()` method is a `@MainActor` `@ViewBuilder` that returns the appropriate SwiftUI view for the current emoji's state.

### Rendering Logic

The view is resolved based on the current ``SymbolPicker/SPEmoji/tone`` index:
- **Default Tone (`0`)**: Returns an ``SymbolPicker/SPEmojiView`` initialized with the current `SPEmoji` instance.
- **Skin Variations (`1` to `n`)**: Returns an ``SymbolPicker/SPEmojiSkinView`` initialized with the corresponding ``SymbolPicker/SPEmoji/Skin`` from the ``SymbolPicker/SPEmoji/skins`` array.

### View Composition

The resulting view handles:
- **Scaling**: Emojis are rendered as standard SwiftUI `Text` elements with dynamic scaling and a fixed font size that fills the available container.
- **Accessibility**: Applies localized annotations as accessibility labels.
- **Drawing Group**: Uses `drawingGroup()` for optimized rendering in lists and grids.

### Performance

This method is designed to be called within SwiftUI's `ForEach` and other collection containers. The underlying views are lightweight and leverage caching to maintain high performance during scrolling.
