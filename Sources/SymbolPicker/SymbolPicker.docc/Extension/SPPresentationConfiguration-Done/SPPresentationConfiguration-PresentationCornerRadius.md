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

You set the roundness of the picker's corners.

## Overview

Use `presentationCornerRadius` to change the curve of the sheet or popover edges. This helps you match the SymbolPicker's look to your app's specific design language.

If you pass `nil`, the system restores its default radius for the current platform. Setting a custom value like 24 creates a softer, more modern appearance, while a smaller value makes the container look sharper.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationCornerRadius(24)
```
