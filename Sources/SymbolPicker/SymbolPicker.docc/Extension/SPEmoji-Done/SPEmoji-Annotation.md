# ``SymbolPicker/SPEmoji/annotation``

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

A localized, descriptive name for the emoji.

## Overview

The `annotation` property provides a human-readable label for the emoji (e.g., `"Grinning Face"` or `"Uśmiechnięta twarz"`). This description is loaded from locale-specific JSON resources and is a primary target for the search engine.

### Accessibility

This property is also used as the default accessibility label in ``SymbolPicker/SPEmojiView``, ensuring that the emoji is correctly described to users of assistive technologies like VoiceOver.
