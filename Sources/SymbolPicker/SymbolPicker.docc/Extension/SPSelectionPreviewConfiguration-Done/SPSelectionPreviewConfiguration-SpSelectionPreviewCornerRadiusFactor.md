# ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCornerRadiusFactor(_:)``

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

Sets the corner radius factor for the selection preview and returns the modified configuration.

- Parameter value: The new corner radius factor (0.0 to 1.0).
- Returns: The updated configuration instance.

## Overview

`spSelectionPreviewCornerRadiusFactor(_:)` is a chainable method used to update the ``SymbolPicker/SPSelectionPreviewConfiguration/selectionPreviewCornerRadiusFactor`` property.

### Usage in Code

```swift
let config = SPSelectionPreviewConfiguration()
    .spSelectionPreviewCornerRadiusFactor(0.5)
```
