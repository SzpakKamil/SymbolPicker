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

The default initializer configures the option list with platform-appropriate styling values.

- **Corner Radius Factor**: Varies by platform (e.g., `0.25` on iOS/macOS, `0.45` on watchOS/visionOS).
- **Padding Factor**: `0.30`.
- **Foreground Color**: `.primary`.
- **Background Color**: `.clear` (with state-specific opacities for selection/focus).

### Usage in Code

```swift
let config = SPOptionListConfiguration()
```
