# ``SymbolPicker/SPEmoji/Skin/isAvailable()``

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

Performs a runtime check to verify if the skin variation is supported on the current device.

## Overview

The `isAvailable()` method is a critical safety feature that prevents the application from attempting to render specific Unicode emoji variations that are not supported by the host operating system or the system's emoji font.

### Dynamic Verification

Because the set of available emoji variations is tied to Unicode releases and OS-specific rendering updates, a simple static check is insufficient. Instead, this method leverages the base ``SymbolPicker/SPEmoji``'s static verification logic:
1. **Unicode Version Check**: Verifies the variation's ``SymbolPicker/SPEmoji/Skin/version`` against the current OS's Unicode support map. This is essential for variations introduced in later Unicode versions (e.g., Emoji 15.0).
2. **Render Capability Check**: Uses the static ``SymbolPicker/SPEmoji/isEmojiRenderable(_:)`` method to perform a CoreText inspection of the glyph. This ensures that the system's "AppleColorEmoji" font contains valid glyphs for the specific variation scalars.

### Granular Status

A skin variation's availability is independent of its base emoji. For example, a base emoji introduced in Unicode 12.0 might be available, while a specific skin tone variation introduced in Unicode 14.0 for that same emoji would return `false` on older operating systems. This granularity ensures the `SymbolPicker` only presents valid options to the user.

### Impact on User Experience

This method is used by the `SymbolPicker` to filter the variation selector interface. By excluding unsupported skin tones, the picker prevents users from selecting an emoji that would result in a broken "tofu" glyph (missing glyph placeholder), maintaining a polished and reliable user interface.
