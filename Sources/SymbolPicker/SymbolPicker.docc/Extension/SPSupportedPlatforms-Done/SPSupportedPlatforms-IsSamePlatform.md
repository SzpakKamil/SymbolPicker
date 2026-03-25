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

Checks if another platform matches the type of the current instance.

- Parameter other: The `SPSupportedPlatforms` instance to compare against.
- Returns: `true` if the platforms are of the same type (e.g., both are `.iOS`), regardless of their version numbers.

## Overview

The `isSamePlatform(as:)` method allows you to compare two platform instances while ignoring their version numbers. This is useful for high-level platform detection where only the OS type (iOS, macOS, etc.) matters.
