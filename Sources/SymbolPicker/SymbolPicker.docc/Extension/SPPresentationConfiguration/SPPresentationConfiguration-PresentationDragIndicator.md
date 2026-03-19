# ``SymbolPicker/SPPresentationConfiguration/presentationDragIndicator``

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

The visibility of the sheet's drag indicator.

## Overview

The `presentationDragIndicator` property controls the small horizontal handle at the top of a sheet, which indicates that it can be resized or dismissed via a swipe. This setting is primarily applicable to iOS and iPadOS sheet presentations.

### Values

- **visible**: Always show the drag indicator.
- **hidden**: Always hide the drag indicator.
- **automatic**: Let the system decide when to show the indicator.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationDragIndicator(.hidden)
```
