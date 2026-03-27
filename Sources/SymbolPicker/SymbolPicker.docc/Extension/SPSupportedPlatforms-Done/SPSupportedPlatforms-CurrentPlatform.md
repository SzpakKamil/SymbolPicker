# ``SymbolPicker/SPSupportedPlatforms/currentPlatform``

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

Returns the current platform and its major OS version.

## Overview

The `currentPlatform` static property detects the platform and major version of the operating system where the library runs.

### Implementation

It uses `ProcessInfo` to get the OS version. Combined with platform macros like `#if os(iOS)`, the property returns the correct enum case with the version number. The library uses this to determine its runtime environment.
