# ``SymbolPicker/SPSelectionPreviewConfiguration/init()``

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

Creates a default selection preview configuration.

## Overview

The default initializer sets up the visual properties for the selection preview:
- **Corner Radius Factor**: Sets to `0.5` on iOS and `1.0` on watchOS.
- **Scale and Offset**: Defaults to `nil` (uses standard system logic).

### Example

```swift
let config = SPSelectionPreviewConfiguration()
```
