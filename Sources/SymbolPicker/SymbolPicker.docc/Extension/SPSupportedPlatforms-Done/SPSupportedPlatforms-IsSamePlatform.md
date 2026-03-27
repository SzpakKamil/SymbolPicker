# ``SymbolPicker/SPSupportedPlatforms/isSamePlatform(as:)``

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

Checks if another platform matches this type.

- Parameter other: The platform to compare.
- Returns: `true` if the platforms are the same type, such as both being `.iOS`.

## Overview

The `isSamePlatform(as:)` method compares two platform instances while ignoring their version numbers. Use this for high-level platform detection where only the OS type (iOS, macOS, etc.) matters.
