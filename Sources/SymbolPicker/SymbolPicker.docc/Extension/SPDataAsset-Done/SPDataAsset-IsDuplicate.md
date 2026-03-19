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

Checks if the asset is semantically the same as another, supporting SF Symbols, Emojis, and custom icons.

- Parameter other: Another asset of the same type.
- Returns: `true` if they are semantically identical; otherwise, `false`.

## Overview

The `isDuplicate(of:)` method provides a way to identify assets that are essentially the same, even if they have different unique identifiers.

### Data Deduplication

During the process of loading and searching for assets, the ``SymbolPicker/SPDataManager`` uses `isDuplicate(of:)` to filter out any redundant assets. This ensures that the user is not presented with multiple identical choices in the picker interface.

### Default Implementation

The default implementation provided by the protocol extension uses the `==` operator for comparison. This is sufficient for most types where `Equatable` conformance is based on the asset's core properties.

### Customization

Conforming types can override this method to provide more specialized deduplication logic. For example, a symbols picker might want to consider two symbols duplicates if they have the same system name, even if they have different metadata (e.g., tags).

### Usage in SPDataManager

The `isDuplicate(of:)` method is called during the `performSearch` phase of the data manager to ensure that the search results are clean and focused.
