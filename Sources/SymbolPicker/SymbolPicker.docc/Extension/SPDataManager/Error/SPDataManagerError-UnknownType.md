# ``SymbolPicker/SPDataManager/Error/unknownType(type:)``

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

Indicates that an operation was requested for a data type that the `SPDataManager` does not recognize or support.

- Parameter type: The string name of the unrecognized type.

## Overview

The `unknownType` error is used as a safety mechanism to prevent the system from attempting to load resources for asset types that have not been properly defined or registered within the system.

### When it occurs

This error typically happens when:
- A generic type is passed to ``SymbolPicker/SPDataManager/fetch(type:)`` or ``SymbolPicker/SPDataManager/search(_:for:)`` that does not have a valid ``SymbolPicker/SPDataAsset/filePrefix``.
- A new asset type has been added to the package but its resource loading logic hasn't been fully implemented.
