# ``SymbolPicker/SPDataAsset/matches(_:)``

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

Checks if the asset should be included in search results for a given text, supporting SF Symbols, Emojis, and custom icons.

- Parameter text: The string to search for.
- Returns: `true` if the asset matches the search query; otherwise, `false`.

## Overview

The `matches(_:)` method provides the logic for determining whether an asset is relevant to the user's search query. This is the primary way that searching is implemented for different asset types.

### Search Criteria

By default, the `matches(_:)` implementation provided by the protocol extension evaluates the search query against the following properties (case-insensitive):
- ``SymbolPicker/SPDataAsset/annotation``: the localized name of the asset.
- ``SymbolPicker/SPDataAsset/category``: the high-level group name.
- ``SymbolPicker/SPDataAsset/subcategory``: the more specific classification name.
- ``SymbolPicker/SPDataAsset/tags``: a list of keywords associated with the asset.

### Customization

While the default implementation is comprehensive for most cases, conforming types can override this method to provide more specialized search logic. For example, a symbols picker might want to prioritize matches in the symbol's name over tags.

### Performance Considerations

Because `matches(_:)` is called for every loaded asset during a search, the implementation should be as efficient as possible. Standard string comparisons and filtering are typically performant enough for most asset collections.
