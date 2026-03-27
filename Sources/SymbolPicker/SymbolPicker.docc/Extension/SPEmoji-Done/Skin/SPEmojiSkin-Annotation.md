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

A localized name for the skin variation.

## Overview

The `annotation` property provides a human-readable label for an emoji variation, such as "Light Skin Tone." SymbolPicker loads these descriptions from JSON files.

### Accessibility

The system uses this property as the default accessibility label in the skin tone selector. This ensures VoiceOver provides accurate descriptions of the choices.

### Search

The skin variation's annotation improves search relevance. It helps users find specific variations when they search for refined terms.
