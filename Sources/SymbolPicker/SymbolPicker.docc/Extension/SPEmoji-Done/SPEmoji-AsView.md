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

Returns a SwiftUI view for the emoji.

## Overview

The `asView()` method uses `@ViewBuilder` to return the correct view for the emoji's current state.

### Logic

The method checks the ``SymbolPicker/SPEmoji/tone`` index:
- **Default (`0`)**: Returns an ``SymbolPicker/SPEmojiView`` using the base emoji.
- **Variations (`1` to `n`)**: Returns an ``SymbolPicker/SPEmojiSkinView`` using the skin from the ``SymbolPicker/SPEmoji/skins`` array.

### View Settings

The returned view handles these tasks:
- **Sizing**: Uses standard `Text` elements that scale to fill their container.
- **Accessibility**: Sets the localized annotation as the accessibility label.
- **Optimization**: Applies `drawingGroup()` to keep the grid smooth during scrolling.

### Usage

SwiftUI collection views call this method to populate their cells. The views are lightweight and use internal caching to maintain high frame rates in the picker.
