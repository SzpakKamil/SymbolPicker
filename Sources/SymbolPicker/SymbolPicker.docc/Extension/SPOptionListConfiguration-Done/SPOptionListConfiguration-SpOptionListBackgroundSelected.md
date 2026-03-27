# ``SymbolPicker/SPOptionListConfiguration/spOptionListBackgroundSelected(_:)``

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

Sets the background color for selected items.

- Parameter value: The background color.
- Returns: The updated configuration.

## Overview

The `spOptionListBackgroundSelected(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundSelected`` property. It sets the highlight color for the item the user has chosen.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListBackgroundSelected(.blue.opacity(0.1))
```
