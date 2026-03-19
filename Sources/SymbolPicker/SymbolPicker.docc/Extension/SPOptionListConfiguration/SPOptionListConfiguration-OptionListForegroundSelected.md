# ``SymbolPicker/SPOptionListConfiguration/optionListForegroundSelected``

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

The foreground color for selected list items.

## Overview

The `optionListForegroundSelected` property determines the color of an asset cell when it has been chosen by the user.

### Usage in Code

```swift
let config = SPOptionListConfiguration()
    .spOptionListForegroundSelected(.blue)
```
