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

Verifies if the device supports the skin variation.

## Overview

The `isAvailable()` method prevents the app from rendering Unicode emoji variations that the operating system or system font does not support.

### Verification Logic

Availability depends on Unicode releases and OS updates. The method performs two checks:
1. **Unicode Version**: It compares the ``SymbolPicker/SPEmoji/Skin/version`` against the system's Unicode support map.
2. **Render Capability**: It uses CoreText to inspect the glyph. This ensures the "AppleColorEmoji" font contains the correct scalars for the variation.

### Details

A skin variation's status is independent of the base emoji. If an emoji exists but a specific tone variation was added in a later Unicode version, this method returns `false` on older systems. The picker uses this logic to filter the skin tone selector and avoid showing broken "tofu" placeholders.
