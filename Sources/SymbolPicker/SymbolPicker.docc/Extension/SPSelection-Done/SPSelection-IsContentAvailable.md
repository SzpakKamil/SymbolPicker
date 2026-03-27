# ``SymbolPicker/SPSelection/isContentAvailable()``

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

Checks if the underlying asset is available for the current system.

## Overview

Check if the selected asset is available on the current system. The `isContentAvailable()` method performs platform-specific checks to ensure the host device can render the asset.

### Availability Logic

The check varies by selection ``SymbolPicker/SPSelection/type``:

- **Symbol**: Verifies OS support for the SF Symbol names.
- **Emoji**: Checks if the system can render the character.
- **Image**: Ensures the custom image asset exists and is accessible.
- **Color**: Pure colors are always considered available.

### Usage in Library

This check prevents `SymbolPicker` from showing broken content on older devices. It filters out assets that were added in newer OS versions but are being viewed on incompatible systems. This ensures a stable user experience across different generations of Apple hardware.
