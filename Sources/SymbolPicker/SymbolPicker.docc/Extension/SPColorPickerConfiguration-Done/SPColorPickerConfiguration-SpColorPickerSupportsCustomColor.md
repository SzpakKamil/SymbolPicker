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

Toggles custom color selection.

- Parameter value: Set `true` to enable custom selection.
- Returns: The updated configuration.

## Overview

The `spColorPickerSupportsCustomColor(_:)` method updates the ``SymbolPicker/SPColorPickerConfiguration/supportCustomColor`` property. It returns the configuration so you can chain other settings.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerSupportsCustomColor(true)
```
