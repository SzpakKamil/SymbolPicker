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

The Unicode version that introduced this variation.

## Overview

The `version` property stores the Unicode release number for the variation, such as `12.0` or `15.0`.

### Compatibility

This property powers the ``SymbolPicker/SPEmoji/Skin/isAvailable()`` method. Since operating systems support different Unicode releases, `version` lets the picker filter out variations the device cannot render.

### Precision

A skin variation can have a different version than its parent emoji. An emoji might appear in Unicode 12.0, while its skin tones arrive in Unicode 14.0. This property tracks those differences to ensure accurate availability checks.
