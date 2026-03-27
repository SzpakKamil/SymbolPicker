# ``SymbolPicker/SPPresentationConfiguration/spPresentationContentInteraction(_:)``

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

You choose how the picker reacts to scrolling gestures and get the updated configuration.

- Parameter value: The content interaction style.
- Returns: The updated configuration instance.

## Overview

`spPresentationContentInteraction(_:)` updates the ``SymbolPicker/SPPresentationConfiguration/presentationContentInteraction`` property. This chainable method gives you control over sheet resizability. You use it to prevent the sheet from moving up or down while a user is flicking through the symbol grid.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationContentInteraction(.resizes)
```
