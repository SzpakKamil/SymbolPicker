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

Asynchronously retrieves a collection of symbols from the package bundle.

## Overview

The `fetchAssets(locale:)` method is the core entry point for loading symbol data. It performs a multi-stage pipeline to ensure that the application receives a set of localized, valid, and unique symbols.

### The Loading Pipeline

1. **Bundle Resolution**: Locates the JSON resources within the module's bundle.
2. **Locale Handling**: Attempts to find a locale-specific file (e.g., `symbols_de.json`). If the requested locale isn't supported, it defaults to the English (`en`) variant.
3. **OS Compatibility Check**: For every symbol in the source file, it executes an availability check. Only symbols that can be rendered on the current operating system version are included in the final collection.
4. **Data Integrity**: Removes any duplicate entries based on the symbol's unique identifier.

### Technical Parameters

- `locale`: A string representing the IETF language tag (e.g., `"en-US"`, `"fr"`). This parameter determines which localized metadata is used for annotations and search terms.

### Performance Considerations

Because this method involves reading from disk and performing system image lookups, it is designed as an `async` function. This prevents blocking the main thread during initialization, ensuring a smooth transition when the symbol picker is presented.
