# ``SymbolPicker/SPDataAsset/isDuplicate(of:)``

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

Checks if two assets match semantically.

- Parameter other: Another asset of the same type.
- Returns: `true` if they match; otherwise, `false`.

## Overview

The `isDuplicate(of:)` method identifies identical assets, even if they have different unique identifiers.

### Deduplication

``SymbolPicker/SPDataManager`` uses this method to filter out extra assets when loading and searching. This prevents duplicate choices in the UI.

### Default Logic

The default implementation uses the `==` operator. This works for most types that follow `Equatable`.

### Customization

You can provide your own logic. A symbol picker might treat two symbols as duplicates if they share the same system name, regardless of their tags.

### Search

The search phase calls this method to clean up results.
