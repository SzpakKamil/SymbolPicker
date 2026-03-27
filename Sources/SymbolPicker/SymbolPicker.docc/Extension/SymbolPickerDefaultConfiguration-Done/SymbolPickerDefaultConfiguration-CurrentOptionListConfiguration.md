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

A closure for resolving the asset grid look.

## Overview

The `currentOptionListConfiguration` property resolves the visual style of the main asset grid (``SymbolPicker/SPOptionList``).

### Customization

Use this closure to change the grid's appearance based on the active style.

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentOptionListConfiguration = { style in
    var oConfig = SPOptionListConfiguration(style: style)
    oConfig.cornerRadiusFactor = 0.5 // Round the cells
    return oConfig
}
```
