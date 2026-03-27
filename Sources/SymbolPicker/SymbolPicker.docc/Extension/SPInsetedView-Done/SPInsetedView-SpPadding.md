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

Sets custom padding for the inseted view.

- Parameter edges: The edges to pad.
- Parameter value: The padding amount in points. If `nil`, the system uses standard platform padding.
- Returns: A modified `SPInsetedView` instance.

## Overview

Use `spPadding(_:value:)` to control the spacing around your custom inset view. This ensures your view aligns with the picker's internal elements and maintains a consistent layout.

### Example

```swift
let paddedView = SPInsetedView(placement: .safeAreaTop) {
    Text("Header")
}
.spPadding(.horizontal, value: 20)
.spPadding(.top, value: 10)
```
