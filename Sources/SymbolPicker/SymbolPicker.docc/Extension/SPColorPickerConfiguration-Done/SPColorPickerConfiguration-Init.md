# ``SymbolPicker/SPColorPickerConfiguration/init()``

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

Creates a default color picker configuration.

## Overview

The default initializer sets up the color picker with a standard palette and behavior.

- **Colors**: A predefined set of system colors (red, orange, yellow, green, mint, teal, blue, indigo, purple, pink, brown).
- **Layout**: `.row` (horizontal scroll).
- **Custom Color Support**: `true` (enabled).
- **Opacity Support**: `false` (disabled).

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
```
