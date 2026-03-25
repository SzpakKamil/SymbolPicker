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

The `isContentAvailable()` method performs a platform-specific check to ensure that the asset currently assigned to the selection can be rendered on the host device.

### Availability Logic

The check depends on the selection ``SymbolPicker/SPSelection/type``:

- **Symbol**: Checks if the SF Symbol names are supported by the current OS version.
- **Emoji**: Checks if the emoji character can be rendered on the system.
- **Image**: Checks if the custom image asset exists and is accessible.
- **Color**: Pure colors are always considered available.

### Usage in SymbolPicker

This method is crucial for ensuring that the `SymbolPicker` does not display broken or unsupported content to the user. It allows the library to filter out assets that were added in newer OS versions but are being viewed on older devices.
