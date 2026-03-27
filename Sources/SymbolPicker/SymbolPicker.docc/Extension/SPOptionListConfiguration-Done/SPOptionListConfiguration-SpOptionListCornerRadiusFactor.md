# ``SymbolPicker/SPOptionListConfiguration/spOptionListCornerRadiusFactor(_:)``

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

Sets the corner radius multiplier for list items.

- Parameter value: The multiplier (0.0 to 0.5).
- Returns: The updated configuration.

## Overview

The `spOptionListCornerRadiusFactor(_:)` method updates the ``SymbolPicker/SPOptionListConfiguration/optionListCornerRadiusFactor`` property. This multiplier applies to the item width to set the final corner rounding in the asset grid.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListCornerRadiusFactor(0.35)
```
