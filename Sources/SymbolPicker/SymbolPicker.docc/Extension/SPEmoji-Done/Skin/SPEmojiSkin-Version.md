# ``SymbolPicker/SPEmoji/Skin/version``

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

The Unicode version where this specific variation was introduced.

## Overview

The `version` property is a numeric representation of the Unicode standard release that first defined this variation (e.g., `12.0`, `14.0`, `15.0`).

### Role in Compatibility

This property is the foundation for the ``SymbolPicker/SPEmoji/Skin/isAvailable()`` method. Because different operating systems support different Unicode releases, the `version` property allows the picker to dynamically filter and hide variations that cannot be correctly rendered on the current device.

### Granularity

The `version` for a skin variation can be different from the version of the parent emoji. For example, a base emoji may have been introduced in Unicode 12.0, while a specific skin tone variation for that emoji might have been added in Unicode 14.0. This granular tracking ensures the most accurate availability status for each glyph.
