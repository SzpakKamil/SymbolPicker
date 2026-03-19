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

Sets the content interaction behavior for the presentation and returns the modified configuration.

- Parameter value: The content interaction style.
- Returns: The updated configuration instance.

## Overview

`spPresentationContentInteraction(_:)` is a chainable method used to update the ``SymbolPicker/SPPresentationConfiguration/presentationContentInteraction`` property, primarily for controlling sheet resizability during scrolling.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationContentInteraction(.resizes)
```
