# ``SymbolPicker/SPPresentationConfiguration/init()``

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

You create a new configuration with standard settings.

## Overview

The default initializer provides an `SPPresentationConfiguration` with standard system values. These defaults ensure your picker feels familiar to users immediately.

- **Presentation Type**: You start with `.default`, which typically shows a sheet on iPhone.
- **Drag Indicator**: You get a visible handle at the top of the sheet.
- **Dents**: You get platform-standard heights, such as full-screen on iPhone.
- **Background Color**: You start with a clear background that adopts system colors.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
```
