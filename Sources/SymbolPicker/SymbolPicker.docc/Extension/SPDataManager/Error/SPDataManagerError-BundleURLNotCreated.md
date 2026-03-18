# ``SymbolPicker/SPDataManager/Error/bundleURLNotCreated(fileName:)``

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

A low-level error indicating that a URL for a file in the bundle could not be constructed.

- Parameter fileName: The name of the file for which the URL construction failed.

## Overview

The `bundleURLNotCreated` error occurs when `Bundle.module.url(forResource:withExtension:)` returns nil for a resource file that is expected to exist.

### Significance

This error is primarily diagnostic, indicating issues with:
- Asset bundling during the build process.
- Incorrect file naming conventions.
- Resource management in the package's `Sources/Resources` directory.
