# ``SymbolPicker/SPColorPickerConfiguration/spColorPickerColors(_:)-(CKColor...)``

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

Sets picker colors using a variadic list.

- Parameter colors: A list of `CKColor` objects.
- Returns: The updated configuration.

## Overview

The `spColorPickerColors(_:)` method updates the ``SymbolPicker/SPColorPickerConfiguration/colors`` property. It returns the configuration to allow chaining other settings.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerColors(.red, .blue, .green)
```
