# ``SymbolPicker/SymbolPickerDefaultConfiguration``

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

The default settings for SymbolPicker.

## Overview

`SymbolPickerDefaultConfiguration` provides a platform-aware starting point for customization. It serves as the foundation for picker behavior when you do not provide a custom configuration.

### Features

- **Adaptive Styles**: Automatically chooses between `.compact` (iOS 26+, visionOS) and `.detail` (macOS, older iOS).
- **Native Search**: Configures the search bar with the best toolbar placement for each OS.
- **Responsive Layout**: Sets ``SymbolPicker/SPInsetedView`` and ``SymbolPicker/SPSpacing`` values that scale with dynamic type.

### Customization

Use `SymbolPickerDefaultConfiguration` as a base for your own setups. Because it uses closures to resolve component styles, you can override specific behaviors while keeping the defaults.

```swift
var myConfig = SymbolPickerDefaultConfiguration()
myConfig.symbolVariant = .outlined
myConfig.allowSearching = false
```

## Topics

### Initializers
- ``SymbolPicker/SymbolPickerDefaultConfiguration/init()``

### Global State
- ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/symbolVariant``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/supportedTypes``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/defaultType``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/allowSearching``

### Component Closures
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentPresentationConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentColorPickerConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentOptionListConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSelectionPreviewConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentInsetViewConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSpacingConfiguration``

### Resolution Methods
- ``SymbolPicker/SymbolPickerDefaultConfiguration/presentationConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/colorPickerConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/optionListConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/selectionPreviewConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/insetViewsConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/spacingConfiguration()``
