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

Returns the major OS version number stored in the platform case.

## Overview

The `majorVersion` property allows you to extract the integer version number from any `SPSupportedPlatforms` instance.

### Data Access

This property switches over the enum cases and returns the associated version value if it exists. This is useful for performing more granular version checks (e.g., "Is the current version 17 or higher?") within the picker's logic.
