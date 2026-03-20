# ``SymbolPicker/SPOptionListConfiguration/spOptionListForegroundFocused(_:)``

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

Sets the foreground color for focused items and returns the modified configuration.

- Parameter value: The new color.
- Returns: The updated configuration instance.

## Overview

`spOptionListForegroundFocused(_:)` is a chainable method used to update the ``SymbolPicker/SPOptionListConfiguration/optionListForegroundFocused`` property.

### Usage in Code

```swift
let config = SPOptionListConfiguration()
    .spOptionListForegroundFocused(.white)
```
   
