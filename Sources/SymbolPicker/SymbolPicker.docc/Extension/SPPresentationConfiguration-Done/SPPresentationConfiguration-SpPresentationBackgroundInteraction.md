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

You control if the app stays interactive while the picker is open and get the updated configuration.

- Parameter value: The background interaction mode.
- Returns: The updated configuration instance.

## Overview

`spPresentationBackgroundInteraction(_:)` updates the ``SymbolPicker/SPPresentationConfiguration/presentationBackgroundInteraction`` property. 

This method lets you set specific height points (detents) where interaction is allowed. For instance, you can allow users to touch the background when the sheet is small, but block them when it expands to full screen.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationBackgroundInteraction(.enabled(upThrough: .medium))
```
