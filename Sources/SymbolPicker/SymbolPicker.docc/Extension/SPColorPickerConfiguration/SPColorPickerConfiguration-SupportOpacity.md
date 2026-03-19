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

Enables or disables the opacity (alpha) slider in the color picker.

## Overview

The `supportOpacity` property controls whether the user can adjust the transparency of their selected color. This setting is particularly relevant for the system's custom color picker if enabled.

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerSupportsOpacity(true)
```
