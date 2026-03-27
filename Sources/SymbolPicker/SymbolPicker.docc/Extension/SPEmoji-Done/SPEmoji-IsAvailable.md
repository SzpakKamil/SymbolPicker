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

Checks if the device supports the emoji.

## Overview

The `isAvailable()` method prevents SymbolPicker from showing Unicode emojis that the operating system or system font cannot render.

### Verification Steps

1. **Unicode Version**: Compares the emoji's ``SymbolPicker/SPEmoji/version`` against a map of OS releases. For example, Unicode 15.0 assets require iOS 16.4.
2. **Render Capability**: If the version check passes, the system uses ``SymbolPicker/SPEmoji/isEmojiRenderable(_:)`` to verify the font contains the glyph. This avoids "tofu" boxes in the UI.

### Impact

An emoji is available only if both checks pass. SymbolPicker uses this method during loading to remove unsupported assets. This ensures users only see valid icons on their specific platform and OS version.
