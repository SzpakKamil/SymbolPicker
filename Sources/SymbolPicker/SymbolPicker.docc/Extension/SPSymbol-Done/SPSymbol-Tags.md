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

Keywords for semantic discovery.

## Overview

The `tags` property holds an array of strings describing the symbol's appearance and use. A `paperplane` symbol includes tags like `["send", "mail", "message", "fly"]`.

### Semantic Search

These tags power the search logic in SymbolPicker. Many system names are obscure, so the search engine matches user queries against these tags instead. This allows you to find icons based on concepts rather than exact names.

### Implementation

When you type in the search bar, the system iterates through the symbol library. It checks if your query matches any keyword in the `tags` array. This process ensures the search remains fast and finds relevant results even with thousands of assets.
