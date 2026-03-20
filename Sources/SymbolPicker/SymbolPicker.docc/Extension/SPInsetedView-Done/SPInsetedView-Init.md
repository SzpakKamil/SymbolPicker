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

Initializes a new inseted view with a specific placement and content.

- Parameter placement: The location where the inseted view should be displayed (e.g., top or bottom bar).
- Parameter spacing: Optional vertical spacing between items within the view's content (only applicable on platforms other than watchOS).
- Parameter view: A ViewBuilder closure that returns the view content to be displayed in the inseted area.

## Overview

Use this initializer to create custom content that will be injected into the picker's interface at the specified ``SymbolPicker/SPInsetedView/Placement``.


### Platform Specific Behavior

- **watchOS**: The view is rendered as-is without a containing vertical stack or spacing.
- **Other Platforms**: The content is automatically wrapped in a `VStack` with the provided spacing to ensure consistent layout behavior.

### Usage in Code

```swift
let customTopBar = SPInsetedView(placement: .safeAreaTop, spacing: 8) {
    Text("Custom Header")
        .font(.headline)
}
```
