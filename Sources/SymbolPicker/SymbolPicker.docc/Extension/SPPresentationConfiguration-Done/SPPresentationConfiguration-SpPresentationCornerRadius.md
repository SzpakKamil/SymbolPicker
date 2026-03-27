# ``SymbolPicker/SPPresentationConfiguration/spPresentationCornerRadius(_:)``

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

You adjust how rounded the picker's corners are and get the updated configuration.

- Parameter value: The new corner radius value.
- Returns: The updated configuration instance.

## Overview

`spPresentationCornerRadius(_:)` updates the ``SymbolPicker/SPPresentationConfiguration/presentationCornerRadius`` property. You use this chainable method to make the picker feel integrated with your app's specific style. 

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationCornerRadius(25)
```
