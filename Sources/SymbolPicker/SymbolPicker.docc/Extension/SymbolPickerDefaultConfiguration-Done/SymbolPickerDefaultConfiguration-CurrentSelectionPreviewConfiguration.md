# ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSelectionPreviewConfiguration``

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

A closure for resolving the selection preview card settings.

## Overview

The `currentSelectionPreviewConfiguration` property sets the look and animation for the selection preview area.

### Behavior

By default, the closure returns an ``SymbolPicker/SPSelectionPreviewConfiguration`` object with standard multipliers.

### Customization

Use a custom closure to control preview behavior dynamically, such as adding custom scaling when the user scrolls the grid.

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentSelectionPreviewConfiguration = { style in
    var sConfig = SPSelectionPreviewConfiguration()
    sConfig.cornerRadiusFactor = 1.5 
    return sConfig
}
```
