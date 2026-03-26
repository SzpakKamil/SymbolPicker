# ``SymbolPicker/SymbolPickerDefaultConfiguration/currentOptionListConfiguration``

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

A closure that returns the configuration for the asset grid.

## Overview

The `currentOptionListConfiguration` property is a closure that resolves the visual style and behavior of the main grid (``SymbolPicker/SPOptionList``) where icons and emojis are displayed.

### Behavior

By default, the closure invokes the ``SymbolPicker/SPOptionListConfiguration/init()`` initializer, providing default values for corner radius multipliers, cell padding, and foreground/background colors for various interaction states (focused, pressed, selected).

### Customization

Provide a custom closure to dynamically change the grid's appearance (e.g., cell corner radius) based on the active display style.

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentOptionListConfiguration = { style in
    var oConfig = SPOptionListConfiguration(style: style)
    oConfig.cornerRadiusFactor = 2.0 // More rounded cells
    return oConfig
}
```
