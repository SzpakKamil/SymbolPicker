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

The Unicode version where this emoji was introduced.

## Overview

The `version` property is a numeric representation of the Unicode standard version that first defined this emoji (e.g., `12.0`, `14.0`, `15.1`).

### Importance for Compatibility

This property is the foundation for the ``SymbolPicker/SPEmoji/isAvailable()`` method. Because different operating systems support different Unicode releases, the `version` allows the picker to dynamically hide emojis that cannot be correctly rendered on the current device.

### Usage

While primarily used for internal availability checks, it can also be used for debugging and ensuring data integrity within the emoji catalogs.
