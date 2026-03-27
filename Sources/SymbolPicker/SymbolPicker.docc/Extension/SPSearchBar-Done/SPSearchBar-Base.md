# ``SymbolPicker/SPSearchBar``

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

A search tool for symbols and emojis.

## Overview

`SPSearchBar` lets users filter assets by name, category, or tag.

### Behavior

The search bar works with the picker's state:
- **Contextual Prompts**: The placeholder text changes based on the active page, such as "Search Symbols" or "Search Emojis."
- **Filtering**: The bar hides if you disable searching in the configuration.
- **Persistence**: Queries stay active across UI updates through the `spSearchText` environment value.

### Platform Appearance

The view uses the `SearchBar` package to match system styles:
- **iOS and visionOS**: Uses capsule shapes and blurred materials. On iOS 26+, it applies native glass effects.
- **macOS and tvOS**: Uses rounded rectangular backgrounds and standard focus behaviors.

## Topics

### Initialization

- ``SymbolPicker/SPSearchBar/init()``
