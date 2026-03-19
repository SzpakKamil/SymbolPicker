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

Sets the drag indicator visibility and returns the modified configuration.

- Parameter value: The visibility state (e.g., `.visible`, `.hidden`).
- Returns: The updated configuration instance.

## Overview

`spPresentationDragIndicator(_:)` is a chainable method used to update the ``SymbolPicker/SPPresentationConfiguration/presentationDragIndicator`` property.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationDragIndicator(.visible)
```
