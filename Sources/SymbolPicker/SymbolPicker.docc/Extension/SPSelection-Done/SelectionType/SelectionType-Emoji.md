# ``SymbolPicker/SPSelection/SelectionType/emoji``

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

A selection type for emoji characters.

## Overview

Setting the `type` of an ``SymbolPicker/SPSelection`` to `.emoji` activates the ``SymbolPicker/SPSelection/emoji`` property. Use this type to include native emojis in the picker.

### Data Handling

- The `emoji` property holds the character and skin tone via ``SymbolPicker/SPEmoji``.
- The `asView()` method uses ``SymbolPicker/SPEmojiView`` for rendering.
- The system preserves skin tone data during encoding and decoding.

### UI Integration

When this type is active, SymbolPicker shows the emoji browser. Users can navigate categories and pick skin tones through this view.
