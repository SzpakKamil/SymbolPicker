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

A closure that returns the configuration for the selection preview card.

## Overview

The `currentSelectionPreviewConfiguration` property is a closure that resolves the settings for the card that previews the currently selected asset (``SymbolPicker/SPSelectionPreview``).

### Behavior

By default, the closure returns a standard ``SymbolPicker/SPSelectionPreviewConfiguration`` object with default multipliers and behaviors.

### Customization

Provide a custom closure to dynamically control the preview's behavior, such as custom scaling or offset logic when the user scrolls the grid.

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentSelectionPreviewConfiguration = { style in
    var sConfig = SPSelectionPreviewConfiguration()
    sConfig.cornerRadiusFactor = 1.5 // Custom corner radius multiplier
    return sConfig
}
```
