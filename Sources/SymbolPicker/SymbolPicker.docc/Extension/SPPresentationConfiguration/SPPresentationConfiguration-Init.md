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

Creates a default presentation configuration.

## Overview

The default initializer creates a `SPPresentationConfiguration` with standard system settings.

- **Presentation Type**: `.default` (typically a sheet).
- **Drag Indicator**: `.visible`.
- **Dents**: Platform-dependent defaults (e.g., `[.large]` on standard iOS, `[.medium, .large]` on compact iOS views).
- **Background Color**: `.clear` or standard system background.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
```
