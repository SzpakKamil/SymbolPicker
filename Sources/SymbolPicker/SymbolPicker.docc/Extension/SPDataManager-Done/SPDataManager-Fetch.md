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

Retrieves and organizes assets of a specific type.

- Parameter type: The asset type, such as ``SPSymbol``.
- Returns: An array of categorized assets.

## Overview

The `fetch(type:)` method populates the picker UI. It manages the entire loading pipeline, including caching and localization.

### Pipeline

1. **Cache**: Checks if the data already exists in the thread-safe cache.
2. **Concurrency**: Joins an existing task if a fetch for the same type is in progress.
3. **Locale**: Finds the best locale based on system settings.
4. **Loading**: Calls the static `fetchAssets(locale:)` method. This non-isolated step keeps disk I/O and JSON decoding from blocking other requests.
5. **Grouping**: Sorts assets into categories for SwiftUI `Section` views.

### Usage

SymbolPicker calls this method when initializing the ``SPOptionList`` to fill the grid.
