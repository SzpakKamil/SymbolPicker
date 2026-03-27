# ``SymbolPicker/SPOptionListConfiguration/optionListCornerRadiusFactor``

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

A multiplier for the list item corner radius.

## Overview

The `optionListCornerRadiusFactor` property sets the shape of the asset cells in the picker grid. The system calculates the final corner radius by multiplying the item's width by this factor.

- **0.0**: Creates square corners.
- **0.5**: Creates fully rounded corners (circles).
- **Default**: Varies by platform, typically `0.25`.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListCornerRadiusFactor(0.35)
```
