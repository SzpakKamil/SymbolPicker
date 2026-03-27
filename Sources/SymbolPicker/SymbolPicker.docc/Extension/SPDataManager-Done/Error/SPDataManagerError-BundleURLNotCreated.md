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

An error for failed resource URL construction.

- Parameter fileName: The name of the missing resource.

## Overview

The `bundleURLNotCreated` error occurs when `Bundle.module.url(forResource:withExtension:)` returns `nil` for an expected resource.

### Causes

This diagnostic error indicates:
- Build process failures that omitted assets from the bundle.
- Incorrect file name definitions in the module.
- Mismanaged resource directories in the package structure.
