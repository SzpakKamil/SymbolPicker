# ``SymbolPicker/SPEmoji/tags``

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

An array of keywords associated with the emoji to enhance searchability.

## Overview

The `tags` property contains a list of localized keywords (e.g., `["happy", "joy", "smile"]` for a grinning emoji). These tags allow the search engine to map natural language queries to the correct emoji.

### Search Optimization

By including synonyms and related concepts, tags ensure that the `SymbolPicker` search bar is both flexible and intuitive for the user.
