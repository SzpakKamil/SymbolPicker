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

Initializes a skin variation.

## Overview

The `init(id:annotation:version:)` initializer builds an `SPEmoji.Skin` instance. The system uses this method when decoding variations from the internal catalogs.

### Parameters

- **`id`**: The Unicode hexcode string, like `"1F44B-1F3FB"`.
- **`annotation`**: The localized description, like `"Light Skin Tone"`.
- **`version`**: The Unicode release version for this variation.
