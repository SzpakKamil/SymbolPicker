# ``SymbolPicker/SPDataAsset/category``

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

The primary classification group for the asset, supporting SF Symbols, Emojis, and custom icons.

## Overview

The `category` property provides a high-level grouping mechanism that the `SymbolPicker` uses to organize assets into meaningful sections. For example, in a symbols picker, a category could be "Nature", "Objects", or "People".

### Role in UI Organization

When loading assets, the ``SymbolPicker/SPDataManager`` uses the `category` to group individual assets into ``SymbolPicker/SPCategory`` objects. These categories are then used to:
- Generate section headers in grid and list views.
- Provide a structured navigation experience within the ``SymbolPicker/SPOptionList``.
- Allow users to quickly filter down to a subset of related assets.

### Localization

Categories are typically localized through the same JSON resource files as the assets themselves. This ensures that the organization of the picker remains consistent and understandable across different languages.

### Implementation Detail

When a type conforms to `SPDataAsset`, it must define how it handles categories. For ``SymbolPicker/SPSymbol``, categories are pre-defined by the system metadata, while for ``SymbolPicker/SPEmoji``, they follow standard Unicode category classifications.
