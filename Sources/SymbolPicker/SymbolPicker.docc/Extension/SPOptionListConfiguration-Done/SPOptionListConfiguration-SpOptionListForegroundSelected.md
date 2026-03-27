# ``SymbolPicker/SPOptionListConfiguration/spOptionListForegroundSelected(_:)``

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

Sets the foreground color for selected items.

- Parameter value: The foreground color.
- Returns: The updated configuration.

## Overview

The `spOptionListForegroundSelected(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListForegroundSelected`` property. This sets the color of text and icons for the item the user has chosen.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListForegroundSelected(.blue)
```
