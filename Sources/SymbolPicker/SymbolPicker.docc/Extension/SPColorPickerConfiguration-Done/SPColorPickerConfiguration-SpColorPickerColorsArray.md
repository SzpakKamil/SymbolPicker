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

Sets the array of colors available in the color picker from an array and returns the modified configuration.

- Parameter colors: An array of `CKColor` objects.
- Returns: The updated configuration instance.

## Overview

`spColorPickerColors(_:)` is a chainable method used to update the ``SymbolPicker/SPColorPickerConfiguration/colors`` property, accepting an array of colors.

### Usage in Code

```swift
let colors: [CKColor] = [.red, .blue, .green]
let config = SPColorPickerConfiguration()
    .spColorPickerColors(colors)
```
