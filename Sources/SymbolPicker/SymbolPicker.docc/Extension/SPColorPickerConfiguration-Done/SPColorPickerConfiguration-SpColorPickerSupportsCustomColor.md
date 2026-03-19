# ``SymbolPicker/SPColorPickerConfiguration/spColorPickerSupportsCustomColor(_:)``

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

Sets whether custom colors are supported and returns the modified configuration.

- Parameter value: `true` to enable custom color selection, `false` to disable.
- Returns: The updated configuration instance.

## Overview

`spColorPickerSupportsCustomColor(_:)` is a chainable method used to update the ``SymbolPicker/SPColorPickerConfiguration/supportCustomColor`` property.

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerSupportsCustomColor(true)
```
