# ``SymbolPicker/SPPresentationConfiguration/spPresentationDragIndicator(_:)``

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

You toggle the visibility of the sheet's grab handle and get the updated configuration.

- Parameter value: The visibility state.
- Returns: The updated configuration instance.

## Overview

`spPresentationDragIndicator(_:)` updates the ``SymbolPicker/SPPresentationConfiguration/presentationDragIndicator`` property. Use this chainable method to show the horizontal handle for better discoverability. You can also hide it to create a cleaner, more immersive UI for your users.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationDragIndicator(.visible)
```
