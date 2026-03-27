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

Indicates a missing JSON file in the bundle.

- Parameter fileName: The name of the missing resource.

## Overview

The system throws `fileNotFound` after exhausting all locale-specific and default ("en") search strategies. This happens when:
- Data files for an asset type are missing from the `Resources` folder.
- Resource names do not match the expected prefix.
- The package build did not process the `Resources` folder correctly.
