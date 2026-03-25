# ``SymbolPicker/SPSupportedPlatforms``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

An enumeration defining the platforms supported by the `SymbolPicker` library.

## Overview

The `SPSupportedPlatforms` enum is used for platform detection and version tracking within the library. It allows the picker to adapt its behavior and features to the specific platform it is running on.

### Platform Tracking

Each case of the enum represents a supported OS (iOS, macOS, tvOS, watchOS, or visionOS) and can optionally store the major version number of that OS.

## Topics

### Platforms

- ``SymbolPicker/SPSupportedPlatforms/iOS(_:)``
- ``SymbolPicker/SPSupportedPlatforms/macOS(_:)``
- ``SymbolPicker/SPSupportedPlatforms/tvOS(_:)``
- ``SymbolPicker/SPSupportedPlatforms/watchOS(_:)``
- ``SymbolPicker/SPSupportedPlatforms/visionOS(_:)``

### Static Properties

- ``SymbolPicker/SPSupportedPlatforms/currentPlatform``

### Instance Properties

- ``SymbolPicker/SPSupportedPlatforms/majorVersion``

### Instance Methods

- ``SymbolPicker/SPSupportedPlatforms/isSamePlatform(as:)``
