# ``SymbolPicker/SPPresentationConfiguration/presentationCornerRadius``

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

The corner radius of the SymbolPicker's presentation container.

## Overview

The `presentationCornerRadius` property allows you to customize the rounded corners of the picker's sheet or popover. If set to `nil`, the system's default corner radius for that platform will be used.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationCornerRadius(24)
```
