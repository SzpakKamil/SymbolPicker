# ``SymbolPicker/SPColorPickerConfiguration/spColorPickerLayout(_:spacing:)``

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

Sets the layout direction and optional spacing for the color picker, returning the modified configuration.

- Parameter type: The layout direction (e.g., `.row`, `.grid`).
- Parameter spacing: Optional spacing between color cells.
- Returns: The updated configuration instance.

## Overview

`spColorPickerLayout(_:spacing:)` allows you to simultaneously configure the layout type (``SymbolPicker/SPColorPickerConfiguration/type``) and spacing (``SymbolPicker/SPColorPickerConfiguration/spacing``) of the color picker. It uses the ``SymbolPicker/SPColorPickerConfiguration/Direction`` enum to define how color cells are arranged.

### Usage in Code

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerLayout(.grid, spacing: 10)
```
