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

The distance between individual color cells.

## Overview

Adjust the `spacing` property to change the padding between colors in the picker. You use this to match the picker's density to your app's design.

### Flexible Layouts

When you set this value to `nil`, the system chooses a default spacing. This default varies by platform to ensure the picker looks natural on iOS, macOS, or visionOS. 

This property works with both `.row` and `.grid` layouts. In a grid, it controls both horizontal and vertical gaps, creating a uniform appearance across the entire set of colors.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerLayout(.row, spacing: 15)
```
