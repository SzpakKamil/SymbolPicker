# ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSpacingConfiguration``

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

A closure for resolving picker component spacings.

## Overview

The `currentSpacingConfiguration` property resolves the vertical and horizontal gaps between the picker's modular parts.

### Behavior

By default, the closure calls the static `defaultSpacingConfiguration()` method. This provides platform-aware values that scale based on system dynamic type settings.

### Customization

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentSpacingConfiguration = { style in
    [
        SPSpacing(value: 20, type: .vertical) // Increase vertical spacing
    ]
}
```
