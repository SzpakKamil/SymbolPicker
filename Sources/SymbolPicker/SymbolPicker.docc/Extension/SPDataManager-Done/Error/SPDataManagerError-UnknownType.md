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

An error for unsupported data types.

- Parameter type: The name of the unrecognized type.

## Overview

The `unknownType` error acts as a safety tool. It stops the system from loading resources for asset types that lack a proper definition or registration.

### Causes

This error happens when:
- You pass a generic type to ``SymbolPicker/SPDataManager/fetch(type:)`` or ``SymbolPicker/SPDataManager/search(_:for:)`` that lacks a valid ``SymbolPicker/SPDataAsset/filePrefix``.
- You add a new asset type but do not implement its resource loading logic.
