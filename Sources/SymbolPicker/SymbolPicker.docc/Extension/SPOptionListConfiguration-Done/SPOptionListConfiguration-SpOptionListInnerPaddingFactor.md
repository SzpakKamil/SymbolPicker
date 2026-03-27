# ``SymbolPicker/SPOptionListConfiguration/spOptionListInnerPaddingFactor(_:)``

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

Sets the padding factor for list items.

- Parameter value: The multiplier for inner padding.
- Returns: The updated configuration.

## Overview

The `spOptionListInnerPaddingFactor(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListInnerPaddingFactor`` property. This setting controls the gap between the asset icon and the cell boundary.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListInnerPaddingFactor(0.2)
```
