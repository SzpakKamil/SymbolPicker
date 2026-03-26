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

A closure that returns the set of spacings for the picker's components.

## Overview

The `currentSpacingConfiguration` property is a closure that resolves the vertical and horizontal spacings (``SymbolPicker/SPSpacing``) between the picker's modular components.

### Behavior

By default, the closure invokes the static ``SymbolPicker/SymbolPickerConfiguration/defaultSpacingConfiguration()`` method, providing platform-aware values that scale based on the system's dynamic type settings.

### Customization

Provide a custom closure to adjust the spacing between elements like the search bar, category picker, and asset grid.

```swift
var config = SymbolPickerDefaultConfiguration()
config.currentSpacingConfiguration = { style in
    [
        SPSpacing(value: 20, type: .vertical) // Add more vertical breathing room
    ]
}
```
