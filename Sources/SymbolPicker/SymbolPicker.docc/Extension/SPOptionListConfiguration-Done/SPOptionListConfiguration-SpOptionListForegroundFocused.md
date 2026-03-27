# ``SymbolPicker/SPOptionListConfiguration/spOptionListForegroundFocused(_:)``

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

Sets the foreground color for focused items.

- Parameter value: The foreground color.
- Returns: The updated configuration.

## Overview

The `spOptionListForegroundFocused(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListForegroundFocused`` property. This sets the color of icons and labels when an item has focus.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListForegroundFocused(.white)
```
