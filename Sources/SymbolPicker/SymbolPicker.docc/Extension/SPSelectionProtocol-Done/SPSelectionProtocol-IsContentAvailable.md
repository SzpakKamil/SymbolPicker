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

Checks if the content of the selection (symbol, emoji, or image) is available on the current platform.

- Returns: `true` if the content is available; otherwise, `false`.

## Overview

The `isContentAvailable()` method is a crucial check for ensuring that the `SymbolPicker` only attempts to render valid and supported assets. This is especially important when dealing with SF Symbols that may be version-specific or custom images that may have been moved or deleted.

### Platform Availability

This method leverages platform-specific APIs to verify availability:
- **SPSymbol**: For symbols, it uses `UIImage(systemName:)` on iOS and `NSImage(systemSymbolName:)` on macOS to check if the symbol's name is recognized by the operating system.
- **SPEmoji**: For emojis, it performs a check to see if the Unicode sequence is renderable by the current font system.
- **SPImage**: For custom images, it ensures that the raw data is present and can be converted into a valid platform-native image.

### Usage in Filtering

The `SymbolPicker` uses this method to filter the data it displays to the user. Assets that return `false` from `isContentAvailable()` are excluded from the grid and search results, preventing a broken user experience.
