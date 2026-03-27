# ``SymbolPicker/SPCategory``

A container for grouping assets like SF Symbols or Emojis.

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

The `SPCategory` struct groups ``SymbolPicker/SPDataAsset`` types. You browse these categories, like "Nature" or "Weather," to find specific assets.

### Generics

`SPCategory` works with any type that follows the ``SymbolPicker/SPDataAsset`` protocol. Use it for:
- Symbols (``SPSymbol``)
- Emojis (``SPEmoji``)
- Your own custom asset types.

### Usage

``SymbolPicker/SPDataManager`` builds these categories when you fetch or search for assets. The manager groups items by their category names. Components like ``SymbolPicker/SPOptionList`` then use these category arrays to show assets in grids or lists.

### Conformances

`SPCategory` handles SwiftUI tasks and data management:
- **Identifiable**: Uses the category name as its unique ``SymbolPicker/SPCategory/id``.
- **Equatable**: Compares names and items to update the UI.
- **Comparable**: Sorts categories alphabetically.
- **Sendable**: Loads data safely in background tasks.

## Topics

### Identification & Naming
- ``SymbolPicker/SPCategory/category``
- ``SymbolPicker/SPCategory/id``

### Asset Collection
- ``SymbolPicker/SPCategory/elements``
