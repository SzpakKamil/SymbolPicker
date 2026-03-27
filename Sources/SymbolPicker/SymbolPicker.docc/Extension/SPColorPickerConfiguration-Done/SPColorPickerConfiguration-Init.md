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

The default initializer sets up a standard palette:
- **Colors**: Includes system colors from red to brown.
- **Layout**: Uses a horizontal row.
- **Custom Selection**: Enabled.
- **Opacity**: Disabled.

### Example

```swift
let config = SPColorPickerConfiguration()
```
