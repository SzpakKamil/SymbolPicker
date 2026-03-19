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

A factor that determines the corner radius of the selection preview area.

## Overview

The `selectionPreviewCornerRadiusFactor` property allows for customizing the shape of the large preview at the top of the picker. The final corner radius is calculated as `previewWidth * factor`.

- **1.0**: Perfect circle.
- **0.5**: Standard rounded appearance.
- **0.0**: Sharp square corners.

### Usage in Code

```swift
let config = SPSelectionPreviewConfiguration()
    .spSelectionPreviewCornerRadiusFactor(0.5)
```
