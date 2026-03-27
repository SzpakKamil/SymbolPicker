# ``SymbolPicker/SPPresentationConfiguration/presentationDents``

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

You set the different heights the picker sheet can reach.

## Overview

The `presentationDents` property defines the heights (detents) where the picker's sheet can rest. These detents act as magnetic snap points. Users can pull the sheet to a half-way point or expand it to cover the screen.

### Supported Detents

- **medium**: The sheet snaps to approximately half the screen height.
- **large**: The sheet snaps to cover the full screen.
- **custom**: You define specific pixel or fractional heights.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationDents([.medium, .large])
```
