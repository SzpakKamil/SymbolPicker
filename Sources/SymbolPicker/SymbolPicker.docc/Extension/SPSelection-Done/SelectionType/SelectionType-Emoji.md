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

Indicates that the selection is a standard emoji character.

## Overview

When the `type` of an ``SymbolPicker/SPSelection`` is set to `.emoji`, the selection logic uses the ``SymbolPicker/SPSelection/emoji`` property. This type allows for including native emoji characters in the selection picker.

### Data Handling

In this state:
- The `emoji` property contains the active character and optional skin tone (e.g., ``SymbolPicker/SPEmoji``).
- The `asView()` method renders the emoji using its specialized view (e.g., ``SymbolPicker/SPEmojiView``).
- Emoji selections can be encoded and decoded while maintaining skin tone information.

### UI Integration

The `SymbolPicker` provides an emoji browser when this type is active, presenting categories and skin tone options to the user.
