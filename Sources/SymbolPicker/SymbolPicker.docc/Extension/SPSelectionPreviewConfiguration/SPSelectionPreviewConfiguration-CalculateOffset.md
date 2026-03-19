# ``SymbolPicker/SPSelectionPreviewConfiguration/calculateOffset``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "26.0")
    @Available(macOS, introduced: "26.0")
    @Available(tvOS, introduced: "26.0")
    @Available(watchOS, introduced: "26.0")
    @Available(visionOS, introduced: "26.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "26.0")
    @DocumentationExtension(mergeBehavior: override)
}

A closure that calculates the dynamic vertical offset of the selection preview based on scroll geometry.

## Overview

The `calculateOffset` property is a `@Sendable` closure that takes `ScrollGeometry` as an input and returns a `CGFloat` representing the vertical offset for the preview area.

By implementing this closure, you can create "sticky" or parallax effects for the selection preview as the user scrolls the picker's asset grid.

### Example Implementation

```swift
let config = SPSelectionPreviewConfiguration()
    .spSelectionPreviewCalculateOffset { geometry in
        let minY = geometry.bounds.minY
        let topInset = geometry.contentInsets.top
        let start = -topInset
        let end = start + 61
        let progress = min(max((start - minY) / (start - end), 0), 1)
        return 10 - (30 * progress)
    }
```
