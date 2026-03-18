# ``SymbolPicker/SPDataManager/fetch(type:)``

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

Retrieves all available assets of a specified type, organized by category.

- Parameter type: The type of asset to fetch (e.g., ``SPSymbol`` or any ``SPDataAsset``).
- Returns: An array of ``SPCategory`` objects containing the assets.

## Overview

The `fetch(type:)` method is the primary entry point for populating the picker UI. It orchestrates the entire data loading pipeline, from cache checking to localized resource loading and final categorization.

### Execution Flow

1.  **Cache Check**: It first checks if the requested data is already in the actor's thread-safe cache.
2.  **Concurrency Management**: If a fetch for the same type is already in progress, it joins that existing task instead of starting a new one, preventing redundant operations.
3.  **Locale Resolution**: It determines the most appropriate locale to load based on the user's system settings.
4.  **Resource Loading**: It calls the `nonisolated` static `fetchAssets(locale:)` method on the provided asset type to load the raw JSON data. Because `fetchAssets` is non-isolated, it ensures that the computationally intensive disk I/O and JSON decoding operations do not block the ``SymbolPicker/SPDataManager`` actor's mailbox, maintaining high responsiveness for other requests.
5.  **Grouping**: Finally, it organizes the flat list of assets into a categorized structure that can be directly consumed by SwiftUI's `Section` views.

## Usage in UI

This method is called when the ``SPOptionList`` is first initialized to populate the grid with assets.
