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

Conditionally enables or disables the color picker in the configuration chain.

- Parameter value: A Boolean value that determines whether to include the color picker.
- Returns: The current configuration instance if `value` is `true`, or `nil` if `value` is `false`.

## Overview

`spColorPickerEnabled(_:)` is a specialized control method designed for building dynamic configuration chains. It allows you to conditionally include the color picker component within the ``SymbolPicker/SymbolPickerConfiguration``.

### Dynamic Configuration

This method is particularly useful when the visibility of the color picker depends on a user preference or a specific application state. If `false` is passed, the method returns `nil`, which effectively removes the color picker from the overall configuration.

### Usage in Code

```swift
let isColorAllowed = true // Determined at runtime

let config = SymbolPickerConfiguration()
    .spColorPicker(
        SPColorPickerConfiguration()
            .spColorPickerEnabled(isColorAllowed)
    )
```
