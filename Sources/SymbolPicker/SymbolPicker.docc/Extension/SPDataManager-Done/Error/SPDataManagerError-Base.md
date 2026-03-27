# ``SymbolPicker/SPDataManager/Error``

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

Failures during asset processing.

## Overview

The `SPDataManager.Error` enum maps failures in asset fetching and searching. Catch these in your UI layer to trigger fallback content.

### Scenarios

- **Missing Files**: JSON data for the asset type and locale does not exist.
- **Data Integrity**: JSON decoding failed due to a schema mismatch.
- **System Constraints**: The bundle URL for a resource could not be created.

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
