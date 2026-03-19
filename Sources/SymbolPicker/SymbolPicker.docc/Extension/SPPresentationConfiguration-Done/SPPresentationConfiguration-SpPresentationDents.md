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

Sets the available presentation detents and returns the modified configuration.

- Parameter dents: A set of detents (e.g., `.medium`, `.large`).
- Returns: The updated configuration instance.

## Overview

`spPresentationDents(_:)` is a chainable method used to update the ``SymbolPicker/SPPresentationConfiguration/presentationDents`` property, defining the supported heights for the sheet presentation.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationDents([.medium, .large])
```
