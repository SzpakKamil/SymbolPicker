# ``SymbolPicker/SPColorPickerConfiguration/supportCustomColor``

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

Enables or disables the selection of custom colors from the system color picker.

## Overview

The `supportCustomColor` property determines if a special cell is included in the color picker, allowing the user to choose any color from the operating system's standard color spectrum/eyedropper.

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerSupportsCustomColor(true)
```
