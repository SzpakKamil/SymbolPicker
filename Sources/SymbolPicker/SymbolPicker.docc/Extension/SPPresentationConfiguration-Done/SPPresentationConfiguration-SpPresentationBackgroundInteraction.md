# ``SymbolPicker/SPPresentationConfiguration/spPresentationBackgroundInteraction(_:)``

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

Sets the background interaction behavior for the presentation and returns the modified configuration.

- Parameter value: The background interaction mode.
- Returns: The updated configuration instance.

## Overview

`spPresentationBackgroundInteraction(_:)` is a chainable method used to update the ``SymbolPicker/SPPresentationConfiguration/presentationBackgroundInteraction`` property, allowing you to define if and how the user can interact with views behind the picker.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationBackgroundInteraction(.enabled(upThrough: .medium))
```
