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

A unique composite identifier ensuring stability in SwiftUI lists and grids.

## Overview

The `id` property is a unique string that identifies an ``SymbolPicker/SPSymbol`` instance. It is primarily used for conformance to the `Identifiable` protocol, which is essential for efficient rendering in SwiftUI collections like `List`, `LazyVGrid`, and `ForEach`.

### Composite Construction

To ensure uniqueness across the entire SF Symbols library, the identifier is constructed as a composite string in the full initializer:
`filledName + notFilled + category`

This combination guarantees that symbols with similar names but different categories or variant mappings are treated as distinct entities.

### Stability and Performance

By providing a stable and unique identifier, `SPSymbol` allows SwiftUI to track identity across updates, minimizing unnecessary view re-renders and ensuring smooth animations during filtering or searching.
