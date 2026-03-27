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

A closure for the integrated color picker settings.

## Overview

The `currentColorPickerConfiguration` property resolves the palette, layout, and features for the color selection tool based on the active style.

### Behavior

By default, the closure calls the ``SymbolPicker/SPColorPickerConfiguration/init()`` initializer. If it returns `nil`, the picker hides the color selection tool.

### Customization

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentColorPickerConfiguration = { style in
    var cConfig = SPColorPickerConfiguration(style: style)
    cConfig.supportsOpacity = true // Enable the opacity slider
    return cConfig
}
```
