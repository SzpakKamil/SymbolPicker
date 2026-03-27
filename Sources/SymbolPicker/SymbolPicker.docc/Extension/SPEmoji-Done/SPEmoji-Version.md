# ``SymbolPicker/SPEmoji/version``

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

The Unicode release version for the emoji.

## Overview

The `version` property stores the Unicode standard number that first included the emoji, such as `12.0` or `15.1`.

### Compatibility Checks

This property drives the ``SymbolPicker/SPEmoji/isAvailable()`` method. Because Apple updates Unicode support with OS releases, `version` lets the picker hide emojis that the current device cannot show.

### Data Integrity

Catalog maintainers use this version to ensure the data matches official Unicode specifications. It also helps you debug why certain emojis appear on new devices but not on older ones.
