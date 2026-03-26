# ``SymbolPicker/SymbolPickerDefaultConfiguration/currentPresentationConfiguration``

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

A closure that returns the presentation style for the picker.

## Overview

The `currentPresentationConfiguration` property is a closure that resolves the presentation strategy (sheet, full screen cover, or popover) based on the active ``SymbolPicker/SPDisplayStyle``.

### Behavior

By default, the closure invokes the ``SymbolPicker/SPPresentationConfiguration/init()`` initializer, which uses platform-aware defaults.

### Customization

You can provide a custom closure to dynamically override the presentation behavior based on the active display style.

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentPresentationConfiguration = { style in
    var pConfig = SPPresentationConfiguration(style: style)
    pConfig.type = .sheet // Always use a sheet
    return pConfig
}
```
