# ``SymbolPicker/SPInsetedView/init(placement:spacing:view:)``

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

Initializes an inseted view.

- Parameter placement: The location for the view, such as top or bottom bar.
- Parameter spacing: Optional vertical spacing between items.
- Parameter view: A ViewBuilder closure that returns the content.

## Overview

The `init(placement:spacing:view:)` initializer creates content for specific ``SymbolPicker/SPInsetedView/Placement`` slots in the picker.

### Platform Behavior

- **watchOS**: Renders the view as-is.
- **Other Platforms**: Wraps the content in a `VStack` with the provided spacing for a consistent layout.

### Example

```swift
let customTopBar = SPInsetedView(placement: .safeAreaTop, spacing: 8) {
    Text("Custom Header").font(.headline)
}
```
