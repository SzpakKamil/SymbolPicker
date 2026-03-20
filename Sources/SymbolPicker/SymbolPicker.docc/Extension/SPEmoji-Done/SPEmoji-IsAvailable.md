# ``SymbolPicker/SPEmoji/isAvailable()``

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

Performs a runtime check to verify if the emoji is supported on the current device.

## Overview

The `isAvailable()` method is a critical safety feature that prevents the application from attempting to render Unicode emojis that are not supported by the device's operating system or the system's emoji font.

### Two-Stage Verification

1. **Unicode Version Check**: This stage compares the emoji's ``SymbolPicker/SPEmoji/version`` against a hardcoded map of OS releases. For example, emojis introduced in Unicode 15.0 require iOS 16.4 or later. This is a fast, preliminary check.
2. **Render Capability Check**: If the version check passes, the method then uses ``SymbolPicker/SPEmoji/isEmojiRenderable(_:)`` to verify that the system's "AppleColorEmoji" font actually contains valid glyphs for the specific emoji character. This prevents "tofu" boxes (missing glyph placeholders).

### Combined Status

An emoji is only considered available if both the version check and the render check succeed.

### Filtering Impact

This method is extensively used by the ``SymbolPicker/SPDataManager`` during the asset loading process. By excluding unsupported emojis early, the picker avoids displaying broken or missing glyphs, maintaining a polished user interface across all supported platforms.
