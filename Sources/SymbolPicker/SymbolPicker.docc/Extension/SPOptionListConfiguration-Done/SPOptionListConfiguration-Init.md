# ``SymbolPicker/SPOptionListConfiguration/init()``

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

Creates a default option list configuration.

## Overview

The default initializer sets up platform-appropriate styling:
- **Corner Radius Factor**: Sets to `0.25` on iOS and macOS, or `0.45` on watchOS and visionOS.
- **Padding Factor**: Sets to `0.30`.
- **Colors**: Uses `.primary` for the foreground and `.clear` for the background.

### Example

```swift
let config = SPOptionListConfiguration()
```
