# ``SymbolPicker/SPEmoji/Skin/annotation``

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

A localized, descriptive name for the skin variation.

## Overview

The `annotation` property provides a human-readable, localized label for the specific emoji variation (e.g., `"Light Skin Tone"`). This description is loaded from locale-specific JSON resources and is a primary target for accessibility tools.

### Accessibility Support

This property is utilized as the default accessibility label in the `SymbolPicker` variation selector. By providing specific annotations for each variation, the picker ensures that users of assistive technologies (e.g., VoiceOver) receive accurate and meaningful descriptions of the glyphs they are selecting.

### Role in Search

While the primary emoji search is focused on the parent emoji's annotation, the skin variation's annotation enhances the search relevance, allowing for more specific results when a user is looking for a particular variation.
