# ``SymbolPicker/SPOptionListConfiguration/spOptionListForeground(_:)``

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

Sets the default foreground color for list items.

- Parameter value: The new color.
- Returns: The updated configuration.

## Overview

The `spOptionListForeground(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListForeground`` property. It returns the configuration to allow for chaining.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListForeground(.primary)
```
