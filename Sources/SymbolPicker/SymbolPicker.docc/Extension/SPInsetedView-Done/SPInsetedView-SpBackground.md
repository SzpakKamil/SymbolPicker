# ``SymbolPicker/SPInsetedView/spBackground(_:)``

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

Sets a custom background for the inseted view.

- Parameter background: A ViewBuilder closure that returns the background view.
- Returns: A modified `SPInsetedView` instance.

## Overview

Use `spBackground(_:)` to apply visual styles or materials to the inset area. This helps match the picker's design or separate specific controls from the main grid.

### Example

```swift
let customView = SPInsetedView(placement: .safeAreaBottom) {
    Text("Selection Preview")
}
.spBackground {
    Color.secondary.opacity(0.1)
}
```
