# ``SymbolPicker/SPOptionListConfiguration/spOptionListForegroundPressed(_:)``

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

Sets the foreground color for pressed items.

- Parameter value: The foreground color.
- Returns: The updated configuration.

## Overview

The `spOptionListForegroundPressed(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListForegroundPressed`` property. This sets the color of text and icons when a user presses an item in the grid.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListForegroundPressed(.gray)
```
