# ``SymbolPicker/SPSymbol/tags``

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

An array of keywords used by the search engine for semantic discovery.

## Overview

The `tags` property contains an array of strings that describe the symbol's appearance, meaning, or common uses. For example, a `paperplane` symbol might have tags such as `["send", "mail", "message", "fly"]`.

### Semantic Search

These tags are crucial for the `SymbolPicker`'s search functionality. Instead of relying solely on the symbol's name (which might be obscure), the search engine matches user queries against these tags to provide relevant results. This enables "semantic discovery," where users can find the right icon based on the concept they are looking for.

### Implementation

When a user types in the search bar, the ``SymbolPicker/SPDataManager`` or the search logic iterates through the symbols and checks if the query matches any of the keywords in the `tags` array, ensuring a robust and user-friendly search experience.
