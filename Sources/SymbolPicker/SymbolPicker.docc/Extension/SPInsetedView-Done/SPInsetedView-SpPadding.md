# ``SymbolPicker/SPInsetedView/spPadding(_:value:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

Sets custom padding for specific edges of the inseted view and returns a modified instance.

- Parameter edges: The set of edges to apply padding to.
- Parameter value: The amount of padding to apply in points. If `nil`, standard platform padding is used.
- Returns: A new `SPInsetedView` instance with the specified padding.

## Overview

`spPadding(_:value:)` provides precise control over the spacing around your custom inset view. This ensures that your view aligns correctly with the picker's internal components.

### Usage in Code

```swift
let paddedView = SPInsetedView(placement: .safeAreaTop) {
    Text("Header")
}
.spPadding(.horizontal, value: 20)
.spPadding(.top, value: 10)
```
