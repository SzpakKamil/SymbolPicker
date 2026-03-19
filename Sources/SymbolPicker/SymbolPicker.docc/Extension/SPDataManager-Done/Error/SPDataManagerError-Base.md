# ``SymbolPicker/SPDataManager/Error``

Categorizes and handles failure scenarios that occur during asset loading, decoding, and searching.

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

## Overview

The `SPDataManager.Error` enum is primarily thrown by the following methods within the ``SymbolPicker/SPDataManager`` or during low-level asset processing:
- ``SymbolPicker/SPDataManager/fetch(type:)`` (and its internal counterpart `fetchRaw`)
- ``SymbolPicker/SPDataManager/search(_:for:)``
- Concrete implementations of ``SymbolPicker/SPDataAsset/fetchAssets(locale:)``.

These errors are then propagated to the UI layer where they can be caught to display informative messages or trigger fallback content behaviors.

### Common Error Scenarios

- **Resource Missing**: The requested JSON data for a specific asset type and locale combination could not be found in the app bundle.
- **Data Integrity**: The JSON content of an asset file could not be decoded into the expected Swift type, suggesting a schema mismatch or malformed data.
- **System Constraints**: Low-level failures in constructing bundle URLs for resource files.

## Topics

### Properties

- ``SymbolPicker/SPDataManager/Error/localizedDescription``

### Decoding Errors

- ``SymbolPicker/SPDataManager/Error/decodingFailed(type:error:)``
- ``SymbolPicker/SPDataManager/Error/unknownType(type:)``

### Data Errors 

- ``SymbolPicker/SPDataManager/Error/bundleURLNotCreated(fileName:)``
- ``SymbolPicker/SPDataManager/Error/fileNotFound(fileName:)``
- ``SymbolPicker/SPDataManager/Error/otherError(error:)``
