# ``SymbolPicker/SPColorPickerConfiguration/supportOpacity``

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

Toggles the opacity slider.

## Overview

The `supportOpacity` property determines if users can adjust color transparency. This setting also controls the opacity options in the system color picker when active.

### Details

Opacity settings apply to the selected color and update the preview in real time. Use this when your app needs to support translucent icons or backgrounds.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerSupportsOpacity(true)
```
