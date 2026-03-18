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

Performs a filtered search across all assets of a specific type.

- Parameters:
    - type: The type of asset to search within (e.g., ``SPSymbol`` or any ``SPDataAsset``).
    - text: The search query string.
- Returns: An array of ``SPCategory`` objects containing the search results.

## Overview

The `search(_:for:)` method provides responsive, high-performance filtering of asset data. It uses the ``SymbolPicker/SPDataAsset/matches(_:)`` protocol requirement to determine which items correspond to the user's query.

### Performance & Responsiveness

- **Non-isolated Filtering**: To prevent blocking the actor's mailbox during complex searches across large datasets (like thousands of emojis), the filtering logic is performed in a `nonisolated` context.
- **Deduplication**: The search process automatically removes duplicate assets to ensure the results are clean and unique.
- **Categorization**: Search results are wrapped in a special ``SPCategory`` with a localized "Search Results" description, maintaining UI consistency with the standard picker view.

### Empty Query Behavior

If the search text is empty or contains only whitespace, the method falls back to returning all assets organized by their default categories, identical to a standard ``SymbolPicker/SPDataManager/fetch(type:)`` call.

## Implementation Details

The filtering logic utilizes properties defined in the ``SymbolPicker/SPDataAsset`` protocol, such as ``SymbolPicker/SPDataAsset/annotation``, ``SymbolPicker/SPDataAsset/category``, and ``SymbolPicker/SPDataAsset/tags``, to find matches.
