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

Keywords for finding an asset.

## Overview

The `tags` property lists keywords for searching. These words do not need to appear in the ``SymbolPicker/SPDataAsset/annotation`` or ``SymbolPicker/SPDataAsset/category``.

### Discovery

The default `matches(_:)` method checks these tags. Tags include:
- Synonyms like "love" or "health" for a heart.
- Descriptions like "five points" for a star.
- Alternative names.

### Refinement

Detailed tags help you find specific items in large libraries like SF Symbols or Unicode emojis.

### Localization

Localize tags for every supported language. A "house" symbol should have "home" in English and "dom" in Polish.
