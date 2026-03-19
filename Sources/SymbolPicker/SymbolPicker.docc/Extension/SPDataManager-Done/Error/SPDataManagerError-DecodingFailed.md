# ``SymbolPicker/SPDataManager/Error/decodingFailed(type:error:)``

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

A wrapper for the system `DecodingError` that provides additional context about the asset type being decoded.

- Parameters:
    - type: The string representation of the asset type (e.g., "SPSymbol").
    - error: The underlying `DecodingError` thrown by the `JSONDecoder`.

## Overview

The `decodingFailed` case is essential for identifying and debugging issues where the JSON resource file in the bundle does not match the expected Swift data structure. This can occur due to schema changes or malformed JSON data.

### Troubleshooting

When this error is encountered, it typically indicates that:
- The JSON file format for the specified asset type is incorrect.
- One or more required fields are missing from the JSON data.
- There is a data type mismatch between the JSON values and the corresponding properties in the conforming ``SPDataAsset`` type.
