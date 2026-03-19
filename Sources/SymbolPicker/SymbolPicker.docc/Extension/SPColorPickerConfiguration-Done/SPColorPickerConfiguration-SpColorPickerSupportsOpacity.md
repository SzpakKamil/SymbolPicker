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

Sets whether opacity is supported and returns the modified configuration.

- Parameter value: `true` to enable opacity adjustment, `false` to disable.
- Returns: The updated configuration instance.

## Overview

`spColorPickerSupportsOpacity(_:)` is a chainable method used to update the ``SymbolPicker/SPColorPickerConfiguration/supportOpacity`` property.

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerSupportsOpacity(true)
```
