# ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``

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

The layout strategy for the picker.

## Overview

The `displayStyle` property sets how the picker organizes its interface. By default, it adapts to your platform and system version.

### Default Logic

- **`.compact`**: The system uses this for iOS 26+, visionOS, tvOS 26+, and watchOS 26+. It provides a modern layout with floating toolbars and a clean grid.
- **`.detail`**: The system uses this for macOS and older iOS versions. It provides a structured sidebar or list-based layout.

### Customization

Override the default by manually setting the style in your configuration. This forces a specific layout regardless of the environment.

```swift
var config = SymbolPickerDefaultConfiguration()
config.displayStyle = .detail // Always use the detail layout
```
