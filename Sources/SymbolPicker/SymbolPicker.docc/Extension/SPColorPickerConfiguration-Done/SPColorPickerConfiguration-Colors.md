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

Colors available in the picker.

## Overview

The `colors` property sets the palette users see. Each item is a `CKColor` from ColorKit. This ensures accurate colors across different devices and platforms.

### Default Palette

The picker begins with standard colors like red, orange, and blue.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerColors([.red, .blue, .green])
```
