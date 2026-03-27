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

A descriptive name for the emoji.

## Overview

The `annotation` property provides a localized label for the emoji, such as "Grinning Face." SymbolPicker loads these descriptions from JSON files and uses them for search queries.

### Accessibility

The system uses this property as the default accessibility label in ``SymbolPicker/SPEmojiView``. This ensures VoiceOver correctly describes emojis to users.
