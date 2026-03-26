# ``SymbolPicker/SymbolPickerDefaultConfiguration/init()``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Initializes a new default configuration with platform-aware settings.

## Overview

The default initializer sets up the configuration with values tailored to the current platform and system version.

### Initial State

- **Display Style**: Automatically set to ``SymbolPicker/SPDisplayStyle/compact`` on iOS 26+ and visionOS, and ``SymbolPicker/SPDisplayStyle/detail`` on other platforms.
- **Search**: Enabled by default (`allowSearching = true`).
- **Asset Categories**: All categories are supported by default (SF Symbols, Emojis, and Images).
- **Symbol Variant**: Defaults to ``SymbolPicker/SPSymbol/Variant/filled``.
- **Component Closures**: Initialized to return standard platform-aware configurations for toolbars, grids, and previews.

### Example

```swift
let defaultConfig = SymbolPickerDefaultConfiguration()
```
