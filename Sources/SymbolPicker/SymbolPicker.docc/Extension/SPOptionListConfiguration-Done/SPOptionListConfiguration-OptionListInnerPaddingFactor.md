# ``SymbolPicker/SPOptionListConfiguration/optionListInnerPaddingFactor``

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

A multiplier for the internal padding of list items.

## Overview

The `optionListInnerPaddingFactor` property sets the gap between an icon and its cell boundary. The system calculates the actual padding by multiplying the cell width by this factor.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListInnerPaddingFactor(0.2)
```
