# ``SymbolPicker/SPColorPickerConfiguration/spColorPickerEnabled(_:)``

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

Toggles the color picker in the configuration chain.

- Parameter value: Set to `true` to include the picker.
- Returns: The configuration if `value` is `true`. Otherwise, returns `nil`.

## Overview

Use `spColorPickerEnabled(_:)` to show or hide the picker based on app state. If you pass `false`, SymbolPicker removes the component from the layout.

### Example

```swift
let isColorAllowed = true 

let config = SymbolPickerConfiguration()
    .spColorPicker(
        SPColorPickerConfiguration()
            .spColorPickerEnabled(isColorAllowed)
    )
```
