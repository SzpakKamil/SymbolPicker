# ``SymbolPicker/SPOptionListConfiguration/spOptionListBackground(_:)``

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

Sets the default background color for list items.

- Parameter value: The new color.
- Returns: The updated configuration.

## Overview

The `spOptionListBackground(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListBackground`` property. Use this to set the base color for grid cells.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListBackground(.clear)
```
