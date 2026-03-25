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

The `currentPlatform` static property automatically detects the platform and major version of the operating system where the library is currently running.

### Implementation

It uses `ProcessInfo.processInfo.operatingSystemVersion.majorVersion` combined with platform-specific macros (`#if os(...)`) to return the correct enum case populated with the version number. This is the primary way the library determines its runtime environment.
