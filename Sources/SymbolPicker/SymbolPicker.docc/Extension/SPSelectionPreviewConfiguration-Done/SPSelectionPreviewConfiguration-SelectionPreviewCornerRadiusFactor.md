# ``SymbolPicker/SPSelectionPreviewConfiguration/selectionPreviewCornerRadiusFactor``

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

A multiplier for the selection preview's corner radius.

## Overview

The `selectionPreviewCornerRadiusFactor` property sets the shape of the large preview. The system calculates the final corner radius as `previewWidth * factor`.

- **1.0**: Forms a circle.
- **0.5**: Forms a standard rounded rectangle.
- **0.0**: Forms sharp corners.

### Example

```swift
let config = SPSelectionPreviewConfiguration()
    .spSelectionPreviewCornerRadiusFactor(0.5)
```
