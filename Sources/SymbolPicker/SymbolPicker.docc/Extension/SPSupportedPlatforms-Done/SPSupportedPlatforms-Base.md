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

An enumeration for platforms supported by SymbolPicker.

## Overview

The `SPSupportedPlatforms` enum handles platform detection and version tracking. It lets the picker adapt its behavior and features to the specific system it runs on.

### Platform Tracking

Each case represents a supported OS—iOS, macOS, tvOS, watchOS, or visionOS—and optionally stores the major version number.

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
