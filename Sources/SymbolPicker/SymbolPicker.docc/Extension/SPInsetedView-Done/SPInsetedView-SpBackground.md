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

Sets a custom background view for the inseted view and returns a modified instance.

- Parameter background: A ViewBuilder closure that returns the view to be used as a background.
- Returns: A new `SPInsetedView` instance with the specified background.

## Overview

`spBackground(_:)` allows you to apply a custom visual style or background material to the inset area. This is useful for matching the picker's design or providing visual separation for specific controls.

### Usage in Code

```swift
let customView = SPInsetedView(placement: .safeAreaBottom) {
    Text("Selection Preview")
}
.spBackground {
    Color.secondary.opacity(0.1)
}
```
