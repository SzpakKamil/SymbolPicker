# ``SymbolPicker/SPEmoji/Skin/init(id:annotation:version:)``

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

Initializes a new skin variation instance.

## Overview

The `init(id:annotation:version:)` initializer is used to create a fully-specified `SPEmoji.Skin` instance. This is primarily used by the `Codable` implementation when decoding emoji variations from internal catalogs.

### Key Parameters

- **`id`**: The Unicode hexcode string for the specific variation (e.g., `"1F44B-1F3FB"`).
- **`annotation`**: The localized description of the variation (e.g., `"Light Skin Tone"`). This is optional and may be `nil` if the metadata is not available.
- **`version`**: The Unicode standard release that introduced this variation (e.g., `12.0`, `14.0`, `15.0`).
