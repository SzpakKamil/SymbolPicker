# ``SymbolPicker/SPColorPickerConfiguration/spColorPickerColors(_:)-([CKColor])``

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

Sets picker colors from an array.

- Parameter colors: An array of `CKColor` objects.
- Returns: The updated configuration.

## Overview

The `spColorPickerColors(_:)` method updates the ``SymbolPicker/SPColorPickerConfiguration/colors`` property using the provided array.

### Details

This method helps you set a predefined color palette from a data source or app settings. It returns the configuration for easy setup.

### Example

```swift
let colors: [CKColor] = [.red, .blue, .green]
let config = SPColorPickerConfiguration()
    .spColorPickerColors(colors)
```
