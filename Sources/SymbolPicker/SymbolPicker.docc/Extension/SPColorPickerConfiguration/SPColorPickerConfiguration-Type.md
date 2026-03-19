# ``SymbolPicker/SPColorPickerConfiguration/type``

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

The layout orientation of the color picker component.

## Overview

The `type` property defines how the color cells are arranged within the color picker.

### Layout Styles

- **row**: Arranges the colors in a single horizontal scrollable row.
- **grid**: Arranges the colors in a multi-line grid.

### Automatic Selection

By default, the layout is automatically chosen based on the overall picker's display style (compact vs. detail).

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerLayout(.grid)
```
