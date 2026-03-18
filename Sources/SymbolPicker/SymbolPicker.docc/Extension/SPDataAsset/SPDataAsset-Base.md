# ``SymbolPicker/SPDataAsset``

A protocol that defines the requirements for assets that can be displayed and selected within the SymbolPicker, supporting SF Symbols, Emojis, and custom icons.

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

The `SPDataAsset` protocol serves as the fundamental abstraction for all selectable assets within the SymbolPicker package. It provides a standardized interface that allows the system to treat disparate types—such as SF Symbols, Emojis, and custom icons—uniformly for fetching, searching, and UI rendering.

By conforming to `SPDataAsset`, a type integrates into the package's core architecture, enabling:
- **Generic Fetching**: The ``SymbolPicker/SPDataManager`` can load assets from localized JSON resources in the app bundle using the ``SymbolPicker/SPDataAsset/filePrefix`` and ``SymbolPicker/SPDataAsset/fetchAssets(locale:)`` requirements.
- **Unified Search**: Search logic is standardized through the ``SymbolPicker/SPDataAsset/matches(_:)`` method, which utilizes properties like ``annotation``, ``category``, and ``tags`` to provide a responsive and relevant user experience.
- **Availability Checking**: The ``SymbolPicker/SPDataAsset/isAvailable()`` method ensures that the UI only displays assets that are supported by the user's current operating system and hardware.
- **Visual Representation**: The ``SymbolPicker/SPDataAsset/asView()`` method allows each asset type to define its own SwiftUI rendering logic while remaining compatible with generic grid and list layouts.

### Conformance

To implement `SPDataAsset`, a type must be `Sendable`, `Hashable`, `Equatable`, `Identifiable`, and `Codable`. This ensures that assets can be safely passed between threads (especially important for background fetching in ``SPDataManager``), uniquely identified in SwiftUI collections, and persisted or transmitted as needed.

Existing conformances include:
- ``SymbolPicker/SPSymbol``: Represents Apple's SF Symbols.
- ``SymbolPicker/SPEmoji``: Represents Unicode emojis with support for skin tone variants.

> Note: While ``SymbolPicker/SPImage`` shares many properties with `SPDataAsset`, it is handled separately as it represents user-provided or remote content rather than bundle-provided resources.

## Topics

### Filtering & Categorization Properties
Metadata properties used for grouping and searching assets.

- ``SymbolPicker/SPDataAsset/annotation``
- ``SymbolPicker/SPDataAsset/category``
- ``SymbolPicker/SPDataAsset/subcategory``
- ``SymbolPicker/SPDataAsset/tags``

### Fetching Properties & Methods
Static requirements and methods for loading assets from resources.

- ``SymbolPicker/SPDataAsset/filePrefix``
- ``SymbolPicker/SPDataAsset/fetchAssets(locale:)``
- ``SymbolPicker/SPDataAsset/matches(_:)``
- ``SymbolPicker/SPDataAsset/isAvailable()``
- ``SymbolPicker/SPDataAsset/isDuplicate(of:)``
- ``SymbolPicker/SPDataAsset/isSelection(of:)``


### View Representation
Requirements for rendering the asset in the user interface.

- ``SymbolPicker/SPDataAsset/asView()``
- ``SymbolPicker/SPDataAsset/Body``
