# ``SymbolPicker/SPColorPickerConfiguration/spacing``

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

The spacing between color cells in the color picker.

## Overview

The `spacing` property allows for fine-tuning the layout of the color picker component. If set to `nil`, a platform-appropriate default spacing is used.

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerLayout(.row, spacing: 15)
```
