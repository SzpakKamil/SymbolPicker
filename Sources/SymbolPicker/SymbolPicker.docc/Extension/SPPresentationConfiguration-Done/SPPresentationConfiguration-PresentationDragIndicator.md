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

You toggle the visibility of the sheet's drag handle.

## Overview

Adjust `presentationDragIndicator` to show or hide the horizontal handle at the top of the sheet. This handle signals to you that the sheet is resizable or dismissible with a swipe. 

While `.automatic` lets the system decide, you might hide the indicator for a more immersive, full-screen look. Conversely, showing it on a small sheet helps users understand they can expand the view to see more symbols at once.

### Values

- **visible**: You always show the drag indicator.
- **hidden**: You always hide the drag indicator.
- **automatic**: You let the system decide when to show the handle.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationDragIndicator(.hidden)
```
