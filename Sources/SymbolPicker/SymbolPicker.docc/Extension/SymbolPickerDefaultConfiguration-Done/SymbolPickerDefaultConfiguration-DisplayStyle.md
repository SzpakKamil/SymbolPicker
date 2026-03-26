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

The layout strategy that the picker uses to organize its components.

## Overview

The `displayStyle` property determines the overall visual structure of the picker. By default, it is platform-aware and adapts to the current system version:

- **`.compact`**: Used by default on iOS 26+, visionOS 26+, tvOS 26+, and watchOS 26+. This style focuses on a modern, streamlined look with floating toolbars and a clean grid area.
- **`.detail`**: Used by default on macOS and older versions of iOS and other platforms. This style provides a more classic, structured sidebar or list-based layout.

### Customization

While the default value is platform-dependent, you can manually set it to force a specific layout regardless of the environment.

```swift
var config = SymbolPickerDefaultConfiguration()
config.displayStyle = .detail // Always use the detail layout
```
