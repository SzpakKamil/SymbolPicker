# ``SymbolPicker/SPColorPickerConfiguration/spColorPickerLayout(_:spacing:)``

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

Configure the layout and spacing of the color picker.

- Parameter type: Choose a direction like `.row` or `.grid`.
- Parameter spacing: Set an optional distance between cells.
- Returns: Your updated configuration.

## Overview

Use `spColorPickerLayout(_:spacing:)` to define how you want colors to appear. You can choose between a `.row` for horizontal scrolling or a `.grid` for a multi-line display. This method updates both the type and the spacing in a single call.

### Adjust Spacing

Set the `spacing` to adjust the gap between color cells. If you omit it, the picker uses system defaults that match the current platform's design. This method returns the modified configuration, allowing you to chain it with other setup calls.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerLayout(.grid, spacing: 10)
```
