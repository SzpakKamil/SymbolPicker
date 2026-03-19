# ``SymbolPicker/SPColorPickerConfiguration/colors``

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

The array of colors available for selection in the color picker.

## Overview

The `colors` property defines the color palette presented to the user. Each element in this array is a `CKColor` (from ColorKit), providing high-precision color definitions and support for various color spaces.

### Default Palette

By default, the picker provides a selection of standard system colors (red, orange, yellow, green, etc.).

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerColors([.red, .blue, .green])
```
