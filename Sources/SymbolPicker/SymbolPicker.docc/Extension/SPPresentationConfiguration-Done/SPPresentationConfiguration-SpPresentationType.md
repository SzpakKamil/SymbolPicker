# ``SymbolPicker/SPPresentationConfiguration/spPresentationType(_:)``

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

You choose whether the picker shows as a sheet or a popover and get the updated configuration.

- Parameter value: The new presentation type.
- Returns: The updated configuration instance.

## Overview

`spPresentationType(_:)` is the primary way to set the container style. This chainable method updates the ``SymbolPicker/SPPresentationConfiguration/presentationType`` property. It handles the internal logic of swapping between different presentation modes like sheets and popovers.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationType(.popover)
```
