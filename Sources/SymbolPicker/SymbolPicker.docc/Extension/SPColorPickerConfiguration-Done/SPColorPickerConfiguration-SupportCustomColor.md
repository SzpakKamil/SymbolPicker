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

Toggles the system color spectrum and eyedropper.

## Overview

The `supportCustomColor` property adds a cell to your picker that opens the system color selection tool. Users can pick any hue or use the eyedropper to grab colors from the screen.

### Functionality

Enable this when your predefined color list does not meet every user need. It links your curated palette to the full range of colors available on the device. Users can find exact shades without typing hex codes.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerSupportsCustomColor(true)
```
