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

The default initializer sets up the visual properties for the selection preview area.

- **Corner Radius Factor**: Varies by platform (e.g., `0.5` on standard iOS, `1.0` on watchOS).
- **Calculated Scale**: `nil` (uses default system scaling logic if applicable).
- **Calculated Offset**: `nil` (uses default system offset logic if applicable).

### Usage in Code

```swift
let config = SPSelectionPreviewConfiguration()
```
