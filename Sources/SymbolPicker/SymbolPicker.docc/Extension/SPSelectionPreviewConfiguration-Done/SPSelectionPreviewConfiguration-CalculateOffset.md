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

A closure for calculating the vertical offset of the preview.

## Overview

The `calculateOffset` property is a `@Sendable` closure that takes `ScrollGeometry` and returns a `CGFloat`. Use this to move the preview area as the user scrolls through assets.

### Example

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
