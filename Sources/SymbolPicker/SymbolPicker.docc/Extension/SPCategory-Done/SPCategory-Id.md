# ``SymbolPicker/SPCategory/id``

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

A unique identifier for the category.

## Overview

The `id` property fulfills the `Identifiable` protocol. For `SPCategory`, this computed property returns the ``SymbolPicker/SPCategory/category`` name.

### Performance

SwiftUI uses stable IDs to track asset groups in `ForEach` and list components. This enables:
- Fast view updates and animations.
- Steady scroll positions in long lists.
- Reliable focus management in complex layouts.
