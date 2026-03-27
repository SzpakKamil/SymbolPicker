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

Initializes a default configuration.

## Overview

The default initializer sets up platform-aware values:
- **Display Style**: Uses `.compact` on iOS 26+ and visionOS, or `.detail` on other platforms.
- **Search**: Enabled by default.
- **Categories**: Includes SF Symbols, Emojis, and Images.
- **Symbol Variant**: Defaults to `.filled`.
- **Closures**: Resolves standard layouts for toolbars, grids, and previews.

### Example

```swift
let defaultConfig = SymbolPickerDefaultConfiguration()
```
