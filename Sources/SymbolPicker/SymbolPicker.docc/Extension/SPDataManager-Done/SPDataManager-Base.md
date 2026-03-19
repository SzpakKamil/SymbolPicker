# ``SymbolPicker/SPDataManager``

A public actor responsible for managing the lifecycle of ``SPDataAsset`` assets (Symbols, Emojis, and custom icons).

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

## Overview

`SPDataManager` handles efficient fetching, localized resource resolution, advanced caching, and searching of assets. It acts as the central hub for retrieving assets from the app bundle, providing high-performance search capabilities across different asset types.

### Key Responsibilities

- **Asset Coordinator**: Acts as the central hub for retrieving assets from the app bundle.
- **Search Engine**: Provides high-performance search capabilities across different asset types.
- **Cache Provider**: Ensures that expensive disk I/O and JSON decoding operations are performed only once per asset type and locale.
- **Locale Resolver**: Automatically detects and falls back to appropriate localizations based on the user's system settings.

### How it Works

#### 1. Advanced Caching (Thread-Safe)
As an actor, `SPDataManager` ensures that its internal cache is accessed safely across different threads. It prevents "thundering herd" issues by ensuring that multiple simultaneous requests for the same asset type await the same background task.

#### 2. Localized Resource Resolution
The data manager dynamically resolves which JSON file to load based on the user's system settings:
1.  **Full Match**: Checks for a full locale match (e.g., `fr_CA`).
2.  **Language Match**: Falls back to the language identifier (e.g., `fr`).
3.  **Fuzzy Match**: Attempts to match other regions (e.g., `fr_FR` for a `fr_CA` user).
4.  **Default Fallback**: Finally, it falls back to English (`en`).

#### 3. Categorization & Grouping
The manager processes flat lists of assets into organized structures used by the UI. It maintains the order in which categories first appear, which directly maps to sections in SwiftUI.

#### 4. Search Execution
Search is performed in a `nonisolated` context when possible to avoid blocking the actor's main mailbox while filtering large datasets (like thousands of emojis). It also ensures that duplicate assets are removed from search results.

## Topics

### Management Methods & Types

- ``SymbolPicker/SPDataManager/Error``
- ``SymbolPicker/SPDataManager/fetch(type:)``
- ``SymbolPicker/SPDataManager/search(_:for:)``
