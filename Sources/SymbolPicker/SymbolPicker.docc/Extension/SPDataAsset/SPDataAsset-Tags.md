# ``SymbolPicker/SPDataAsset/tags``

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

A collection of keywords associated with the asset, supporting SF Symbols, Emojis, and custom icons.

## Overview

The `tags` property provides a flexible list of keywords that users can use when searching for an asset. It allows for indexing search terms that are not present in the asset's ``SymbolPicker/SPDataAsset/annotation`` or ``SymbolPicker/SPDataAsset/category``.

### Role in Search Discovery

Search queries are evaluated against these tags in the default implementation of ``SymbolPicker/SPDataAsset/matches(_:)``. Tags can include:
- Synonyms or related concepts (e.g., a "heart" symbol could have tags like "love", "favorite", or "health").
- Visual descriptions (e.g., "star" might have "five points").
- Common misspellings or alternative names.

### Asset Refinement

By providing a rich set of tags, a type conforming to `SPDataAsset` can significantly improve the user's ability to find specific assets, especially in large libraries like the SF Symbol set or the Unicode emoji set.

### Localization

Tags should ideally be localized for each supported language. For instance, the tags for a "house" symbol would be different in English ("home", "building") than in Polish ("dom", "budynek"). This ensures that search is effective and intuitive for users regardless of their locale.
