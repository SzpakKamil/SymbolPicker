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

A factor that determines the corner radius of list items, relative to their width.

## Overview

The `optionListCornerRadiusFactor` property allows for flexible styling of the asset cells in the picker's grid. The final corner radius is calculated by multiplying the item's width by this factor.

- **0.0**: Square corners.
- **0.5**: Fully rounded corners (capsule or circle).
- **Default**: Typically varies by platform (e.g., 0.25).

### Usage in Code

```swift
let config = SPOptionListConfiguration()
    .spOptionListCornerRadiusFactor(0.35)
```
