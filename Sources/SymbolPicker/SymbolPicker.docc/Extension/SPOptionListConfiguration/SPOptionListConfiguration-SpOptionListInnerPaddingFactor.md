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

Sets the inner padding factor for list items and returns the modified configuration.

- Parameter value: The new padding factor (e.g., 0.2).
- Returns: The updated configuration instance.

## Overview

`spOptionListInnerPaddingFactor(_:)` is a chainable method used to update the ``SymbolPicker/SPOptionListConfiguration/optionListInnerPaddingFactor`` property.

### Usage in Code

```swift
let config = SPOptionListConfiguration()
    .spOptionListInnerPaddingFactor(0.2)
```
