# ``SymbolPicker/SPColorPickerConfiguration/spColorPickerSupportsOpacity(_:)``

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

Toggles alpha adjustments in the color picker.

- Parameter value: Set `true` to show the opacity slider.
- Returns: Your updated configuration.

## Overview

Use `spColorPickerSupportsOpacity(_:)` to let users change the transparency of their selected colors. Setting this to `true` displays an opacity slider. The method updates the `supportOpacity` property and returns the modified configuration for chaining.

### Usage

This setting helps when your app requires solid colors or when you want to give users control over the alpha channel. The slider fits into the color selection area and works across all layout types.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerSupportsOpacity(true)
```
