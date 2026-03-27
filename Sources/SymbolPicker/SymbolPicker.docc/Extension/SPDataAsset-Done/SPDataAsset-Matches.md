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

You determine if an icon shows up in search results.

- Parameter text: The search string you are checking.
- Returns: `true` if the icon is relevant.

## Overview

The `matches(_:)` method decides if an asset belongs in the current search results. It runs every time a user types in the search bar.

### Criteria

The default implementation checks these properties:
- ``SymbolPicker/SPDataAsset/annotation``: The localized name of the icon.
- ``SymbolPicker/SPDataAsset/category``: The broad group name.
- ``SymbolPicker/SPDataAsset/subcategory``: Specific groupings.
- ``SymbolPicker/SPDataAsset/tags``: Any associated keywords.

### Customization

You can override this method to add specialized search logic. For example, you might prioritize name matches over tag matches to help users find exact icons faster.

### Performance

Searching calls this method for every loaded asset. You should keep the logic simple to ensure the search bar stays responsive.
