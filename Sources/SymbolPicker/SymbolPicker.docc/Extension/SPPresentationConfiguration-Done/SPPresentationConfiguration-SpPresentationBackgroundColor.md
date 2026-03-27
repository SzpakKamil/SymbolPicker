# ``SymbolPicker/SPPresentationConfiguration/spPresentationBackgroundColor(_:)``

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

You change the color of the picker's background and get the updated configuration.

- Parameter value: The new background color.
- Returns: The updated configuration instance.

## Overview

`spPresentationBackgroundColor(_:)` is a chainable method. It updates the ``SymbolPicker/SPPresentationConfiguration/presentationBackgroundColor`` property. This design lets you set up your picker's look in a single, fluid block of code.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationBackgroundColor(.systemGroupedBackground)
```
