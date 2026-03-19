# ``SymbolPicker/SPPresentationConfiguration/presentationDents``

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

The set of detents (height levels) available for the sheet presentation.

## Overview

The `presentationDents` property defines the various heights at which the picker's sheet can rest. This allows for resizable sheets that can expand or shrink as the user interacts with them.

### Supported Detents

- **medium**: The sheet covers approximately half of the screen.
- **large**: The sheet covers the full screen.
- **custom**: Custom heights defined by the developer.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationDents([.medium, .large])
```
