# ``SymbolPicker/SPSymbol/id``

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

A unique identifier for the symbol.

## Overview

The `id` property identifies an ``SymbolPicker/SPSymbol`` instance. It allows SymbolPicker to use symbols in SwiftUI `List`, `LazyVGrid`, and `ForEach` containers efficiently.

### Construction

The system builds this identifier as a composite string in the full initializer:
`filledName + notFilled + category`

This ensures every symbol is unique, even if symbols share names across different categories or variant mappings.

### Performance

A stable ID lets SwiftUI track items during updates. This reduces re-renders and keeps animations smooth when you filter or search for icons.
