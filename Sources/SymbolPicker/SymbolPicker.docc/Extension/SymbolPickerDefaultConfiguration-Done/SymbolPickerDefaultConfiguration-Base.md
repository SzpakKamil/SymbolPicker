# ``SymbolPicker/SymbolPickerDefaultConfiguration``

The default implementation of the ``SymbolPicker/SymbolPickerConfiguration`` protocol, providing a balanced and platform-aware starting point for customization.

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

## Overview

`SymbolPickerDefaultConfiguration` is designed to provide a high-quality, "out-of-the-box" experience that automatically adapts to the current platform and system version. It serves as the foundation for the picker's default behavior when no custom configuration is specified.

### Platform-Aware Defaults

One of the key strengths of the default configuration is its ability to adjust its properties based on the environment:

- **Display Style**: Automatically chooses between ``SymbolPicker/SPDisplayStyle/compact`` (for modern OS versions like iOS 26+ and visionOS) and ``SymbolPicker/SPDisplayStyle/detail`` (for older versions and macOS).
- **Modern Search**: On supported platforms, it configures the search bar to use the most appropriate toolbar placement and styling.
- **Adaptive Layout**: Provides a default set of ``SymbolPicker/SPInsetedView`` components and ``SymbolPicker/SPSpacing`` values that scale with dynamic type.

### Usage as a Base

While you can use `SymbolPickerDefaultConfiguration` directly, it is also designed to be a flexible base for your own custom configurations. Because it implements the protocol using a closure-based architecture for its component methods, you can easily wrap or override specific behaviors while retaining the rest of the defaults.

```swift
var myConfig = SymbolPickerDefaultConfiguration()
myConfig.symbolVariant = .hierarchical
myConfig.allowSearching = false
```

## Topics

### Initializers
- ``SymbolPicker/SymbolPickerDefaultConfiguration/init()``

### Properties

#### Global State
- ``SymbolPicker/SymbolPickerDefaultConfiguration/displayStyle``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/symbolVariant``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/supportedTypes``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/defaultType``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/allowSearching``

#### Component Configuration Closures
The default configuration uses closures to resolve sub-component styles, allowing for dynamic behavior based on the current state.

- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentPresentationConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentColorPickerConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentOptionListConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSelectionPreviewConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentInsetViewConfiguration``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/currentSpacingConfiguration``

### Methods

#### Configuration Resolution
These methods implement the protocol requirements by invoking the corresponding closure properties.

- ``SymbolPicker/SymbolPickerDefaultConfiguration/presentationConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/colorPickerConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/optionListConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/selectionPreviewConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/insetViewsConfiguration()``
- ``SymbolPicker/SymbolPickerDefaultConfiguration/spacingConfiguration()``
