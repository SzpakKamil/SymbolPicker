# ``SymbolPicker/SPSymbol/fetchAssets(locale:)``

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

Retrieves localized symbols from the package bundle.

- Parameter locale: A string like `"en"` or `"pl"`.
- Returns: A collection of valid symbols for the current OS.

## Overview

The `fetchAssets(locale:)` method loads symbol data. It follows a multi-stage process to deliver localized, unique, and valid symbols to your app.

### Loading Process

1. **Resolution**: Locates JSON resources in the module bundle.
2. **Locale**: Finds the specific file for the requested language. If the locale is missing, it defaults to English (`"en"`).
3. **Compatibility**: Checks availability for every symbol. The method only includes icons that the current OS version can render.
4. **Clean up**: Removes duplicate entries based on unique identifiers.

### Performance

This method uses `async` because it reads from disk and performs system image lookups. This prevents blocking the main thread and ensures the symbol picker appears without lag.
