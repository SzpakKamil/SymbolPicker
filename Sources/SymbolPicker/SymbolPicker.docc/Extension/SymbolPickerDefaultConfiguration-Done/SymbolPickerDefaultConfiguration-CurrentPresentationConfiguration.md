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

A closure for resolving the picker's presentation style.

## Overview

The `currentPresentationConfiguration` property resolves the modal strategy—sheet, full-screen cover, or popover—based on the active ``SymbolPicker/SPDisplayStyle``.

### Behavior

By default, the closure uses platform-aware settings from the ``SymbolPicker/SPPresentationConfiguration`` initializer.

### Customization

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentPresentationConfiguration = { style in
    var pConfig = SPPresentationConfiguration(style: style)
    pConfig.type = .sheet // Force a sheet layout
    return pConfig
}
```
