# ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundSelected``

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

The background color for selected list items.

## Overview

The `optionListBackgroundSelected` property sets the fill color for an asset cell after the user selects it.

### Example

```swift
let config = SPOptionListConfiguration()
    .spOptionListBackgroundSelected(.blue.opacity(0.1))
```
