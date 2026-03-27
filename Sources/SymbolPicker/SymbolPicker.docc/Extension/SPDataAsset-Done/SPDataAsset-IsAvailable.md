# ``SymbolPicker/SPDataAsset/isAvailable()``

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

Checks if the asset works on the current OS.

- Returns: `true` if supported; otherwise, `false`.

## Overview

`isAvailable()` ensures a good experience by only showing assets that the user's OS and hardware support.

### Filtering

``SymbolPicker/SPDataManager`` uses this method to remove unsupported assets during loading. This prevents missing icons or empty blocks in the UI.

### Implementation
- **SPSymbol**: Checks if a `UIImage` or `NSImage` can initialize with the symbol name.
- **SPEmoji**: Verifies the minimum OS version for the Unicode version and performs a CoreText rendering check.

### UI Impact

This method provides a reliable picker across different devices and system versions.
