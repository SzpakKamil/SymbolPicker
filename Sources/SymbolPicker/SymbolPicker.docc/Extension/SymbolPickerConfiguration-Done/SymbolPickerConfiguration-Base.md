# ``SymbolPicker/SymbolPickerConfiguration``

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

Defines the look and behavior of a SymbolPicker.

## Overview

The `SymbolPickerConfiguration` protocol lets you customize every part of the `SymbolPicker`. By following this protocol, you can set custom presentation styles, color palettes, and grid layouts.

The package uses ``SymbolPicker/SymbolPickerDefaultConfiguration`` by default.

### Key Features

- **Styles**: Control sub-components like the asset grid (``SymbolPicker/SPOptionList``), color selector (``SymbolPicker/SPColorPicker``), and preview card (``SymbolPicker/SPSelectionPreview``).
- **Layout**: Use the ``SymbolPicker/SPInsetedView`` system to place custom views in predefined toolbar or safe area slots.
- **Spacing**: Use ``SymbolPicker/SPSpacing`` to scale the layout gracefully with dynamic type settings.
- **Behavior**: Set supported categories (``SymbolPicker/SPPageType``), search rules, and SF Symbol variants (``SymbolPicker/SPSymbol/Variant``).

## Custom Implementation

Create a custom configuration by conforming to the protocol. You can also extend the default configuration and override only the properties you need.

```swift
struct MyCustomConfig: SymbolPickerConfiguration {
    var displayStyle: SPDisplayStyle { .compact }
    var supportedTypes: [SPPageType] { [.symbol] }

    func colorPickerConfiguration() -> SPColorPickerConfiguration {
        var config = SPColorPickerDefaultConfiguration()
        config.colors = [.red, .blue, .green]
        return config
    }
}

// Usage:
SymbolPicker(systemImage: $symbolName, configuration: MyCustomConfig())
```

## Topics

### Component Configurations
- ``SymbolPicker/SymbolPickerConfiguration/presentationConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/colorPickerConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/optionListConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/selectionPreviewConfiguration()``

### Convenience Accessors
- ``SymbolPicker/SymbolPickerConfiguration/presentation``
- ``SymbolPicker/SymbolPickerConfiguration/colorPicker``
- ``SymbolPicker/SymbolPickerConfiguration/optionList``
- ``SymbolPicker/SymbolPickerConfiguration/selectionPreview``

### Layout & Spacing
- ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/insetViews``
- ``SymbolPicker/SymbolPickerConfiguration/spacingConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/spacings``

### Global Properties
- ``SymbolPicker/SymbolPickerConfiguration/displayStyle``
- ``SymbolPicker/SymbolPickerConfiguration/supportedTypes``
- ``SymbolPicker/SymbolPickerConfiguration/defaultType``
- ``SymbolPicker/SymbolPickerConfiguration/symbolVariant``
- ``SymbolPicker/SymbolPickerConfiguration/allowSearching``
