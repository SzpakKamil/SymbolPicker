# ``SymbolPicker/SPDataManager``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

An actor that manages asset lifecycles.

## Overview

`SPDataManager` fetches, caches, and searches assets. It retrieves icons from the app bundle and provides high-performance filtering for the unified picker.

### Responsibilities

- **Coordination**: Acts as the central hub for bundle asset retrieval.
- **Search**: Filters large datasets without lagging.
- **Caching**: Performs disk I/O and decoding once per asset type.
- **Localization**: Resolves which JSON file to load based on system settings.

### Mechanics

- **Caching**: As an actor, `SPDataManager` keeps its cache safe across threads. It prevents redundant background tasks for the same resource.
- **Resolution**: The manager searches for full locale matches (e.g., `fr_CA`), language matches (`fr`), or falls back to English (`en`).
- **Grouping**: It organizes assets into categories for the UI, maintaining the order defined in the data files.
- **Search**: Filtering runs in a `nonisolated` context to keep the actor responsive while processing thousands of entries.

## Topics

### Management Methods
- ``SymbolPicker/SPDataManager/Error``
- ``SymbolPicker/SPDataManager/fetch(type:)``
- ``SymbolPicker/SPDataManager/search(_:for:)``
