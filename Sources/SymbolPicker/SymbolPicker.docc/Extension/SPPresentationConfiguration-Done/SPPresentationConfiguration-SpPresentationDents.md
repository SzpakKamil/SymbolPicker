# ``SymbolPicker/SPPresentationConfiguration/spPresentationDents(_:)``

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

You define the allowed heights for the picker sheet and get the updated configuration.

- Parameter dents: A set of height levels like `.medium` or `.large`.
- Returns: The updated configuration instance.

## Overview

`spPresentationDents(_:)` updates the ``SymbolPicker/SPPresentationConfiguration/presentationDents`` property. This chainable method lets you set the snap points for your sheet. By passing an array of detents, you enable the user to drag the picker between different sizes, such as a compact half-screen view and an expanded full-screen grid.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationDents([.medium, .large])
```
