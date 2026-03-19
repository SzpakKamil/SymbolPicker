# ``SymbolPicker/SPDataManager/Error/fileNotFound(fileName:)``

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

Indicates that the system was unable to locate the requested JSON file in the app bundle.

- Parameter fileName: The name of the JSON file that was not found.

## Overview

The `fileNotFound` error is thrown as a final fallback when the ``SymbolPicker/SPDataManager`` has exhausted all locale-specific and default ("en") resource resolution strategies.

### When it occurs

This error signifies that the required data for an asset type is completely missing from the bundle. This typically happens if:
- A new asset type's data files have not been added to the `Resources` folder.
- The resource files are incorrectly named (e.g., they don't match the expected ``SymbolPicker/SPDataAsset/filePrefix``).
- The `Resources` folder was not correctly processed during the package build.
