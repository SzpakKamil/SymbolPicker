# ``SymbolPicker/SPDataManager/search(_:for:)``

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

Filters assets based on a query.

- Parameters:
    - type: The asset type to search, such as ``SPSymbol``.
    - text: The query string.
- Returns: An array of ``SPCategory`` objects containing matches.

## Overview

The `search(_:for:)` method provides fast filtering for the picker. It uses the ``SymbolPicker/SPDataAsset/matches(_:)`` protocol requirement to find items.

### Performance

- **Non-isolated**: Filtering runs in a `nonisolated` context to avoid blocking the actor's mailbox during large searches.
- **Deduplication**: The process removes duplicate assets to keep results unique.
- **Categorization**: The method wraps results in a special ``SPCategory`` with a localized "Search Results" name.

### Details

If the query is empty or contains only whitespace, the method returns all assets in their default categories. It checks properties like ``SymbolPicker/SPDataAsset/annotation`` and ``SymbolPicker/SPDataAsset/tags`` to find relevant icons.
