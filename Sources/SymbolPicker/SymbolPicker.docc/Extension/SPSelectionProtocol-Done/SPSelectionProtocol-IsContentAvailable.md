# ``SymbolPicker/SPSelectionProtocol/isContentAvailable()``

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

Checks if the platform supports the selection.

- Returns: `true` if supported. Otherwise, returns `false`.

## Overview

The `isContentAvailable()` method prevents SymbolPicker from rendering unsupported assets. This is vital for version-specific SF Symbols or custom images that have been moved.

### Availability Checks

The method uses native APIs:
- **Symbols**: Uses `UIImage(systemName:)` or `NSImage(systemSymbolName:)` to verify the OS recognizes the icon.
- **Emojis**: Checks if the system font can render the Unicode sequence.
- **Images**: Ensures the raw data exists and converts to a native image.

### Usage

SymbolPicker uses this check to filter data. Assets that return `false` do not appear in the grid or search results.
