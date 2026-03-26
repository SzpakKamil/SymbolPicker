# ``SymbolPicker/SymbolPickerDefaultConfiguration/currentColorPickerConfiguration``

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

A closure that returns the configuration for the integrated color picker.

## Overview

The `currentColorPickerConfiguration` property is a closure that resolves the settings for the color selection palette based on the active ``SymbolPicker/SPDisplayStyle``.

### Behavior

By default, the closure invokes the ``SymbolPicker/SPColorPickerConfiguration/init()`` initializer. If it returns `nil`, the color picker interface is entirely hidden.

### Customization

Provide a custom closure to dynamically control the color palette, opacity support, and layout based on the active display style.

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentColorPickerConfiguration = { style in
    var cConfig = SPColorPickerConfiguration(style: style)
    cConfig.supportsOpacity = true // Enable opacity slider
    return cConfig
}
```
