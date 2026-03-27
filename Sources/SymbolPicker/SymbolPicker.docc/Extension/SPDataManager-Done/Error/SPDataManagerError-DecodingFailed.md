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

Identifies JSON structure issues.

- Parameters:
    - type: The asset type, such as "SPSymbol".
    - error: The `JSONDecoder` error.

## Overview

The `decodingFailed` error occurs when a JSON resource does not match the expected Swift structure. This usually points to malformed data or a schema change. Verify that all required fields and data types match the ``SPDataAsset`` requirements.
