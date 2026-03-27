# ``SymbolPicker/SPSupportedPlatforms/majorVersion``

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

The major OS version number for the platform.

## Overview

The `majorVersion` property extracts the integer version from an `SPSupportedPlatforms` case.

### Usage

The property switches over the enum cases and returns the associated version value. Use this for version-specific logic, such as checking if the current system is version 17 or higher to enable modern effects.
