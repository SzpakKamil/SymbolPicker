# ``SymbolPicker/SPSelectionPreviewConfiguration/calculateScale``

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

A closure that calculates the dynamic scale of the selection preview based on scroll geometry.

## Overview

The `calculateScale` property is a `@Sendable` closure that takes `ScrollGeometry` as an input and returns a `CGFloat` representing the desired scale factor for the preview area.

This allows the preview to shrink or grow as the user scrolls through the picker's content, creating a modern, interactive experience.

### Example Implementation

```swift
let config = SPSelectionPreviewConfiguration()
    .spSelectionPreviewCalculateScale { geometry in
        let minY = geometry.bounds.minY
        let topInset = geometry.contentInsets.top
        let start = -topInset
        let end = start + 61
        let progress = min(max((start - minY) / (start - end), 0), 1)
        return 1.0 - 0.5 * progress
    }
```
