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

A unique identifier for the category, used by SwiftUI to track changes in asset groups.

## Overview

The `id` property is a requirement of the `Identifiable` protocol. In the case of `SPCategory`, it is a computed property that simply returns the value of the ``SymbolPicker/SPCategory/category`` name.

### Importance for UI Performance

Since `SPCategory` objects are often used within SwiftUI's `ForEach` and list components, having a stable and unique `id` is crucial for:
- Efficient diffing and animated UI updates.
- Maintaining scroll position in long lists.
- Managing focus state in complex layouts.
