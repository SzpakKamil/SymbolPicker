# ``SymbolPicker/SymbolPickerConfiguration``

The core protocol for defining the appearance, behavior, and layout of a `SymbolPicker`.

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

The `SymbolPickerConfiguration` protocol provides a highly flexible and extensible way to customize every aspect of the `SymbolPicker` component. By conforming to this protocol, developers can define custom presentation styles, color palettes, grid layouts, and auxiliary views.

The package provides a default implementation, ``SymbolPicker/SymbolPickerDefaultConfiguration``, which is used unless a custom configuration is provided.

### Key Aspects of Configuration

- **Component Styles**: Granular control over the appearance and behavior of sub-components like the asset grid (``SymbolPicker/SPOptionList``), the color selector (``SymbolPicker/SPColorPicker``), and the selection preview card (``SymbolPicker/SPSelectionPreview``).
- **Layout System**: A powerful ``SymbolPicker/SPInsetedView`` system for placing custom SwiftUI views into predefined "safe area" or "toolbar" slots defined by ``SymbolPicker/SPInsetedView/Placement``.
- **Dynamic Spacing**: Type-size-aware ``SymbolPicker/SPSpacing`` dimensions that allow the picker's layout to scale gracefully with dynamic type settings.
- **Global Behavior**: Centralized control over supported asset categories (``SymbolPicker/SPPageType``), default page selection, search functionality, and SF Symbol variants (``SymbolPicker/SPSymbol/Variant``).

## Custom Implementation

You can create a custom configuration by conforming to the protocol. For most use cases, it's easier to subclass or extend the default configuration and override only the specific properties or methods you need.

```swift
struct MyCustomConfig: SymbolPickerConfiguration {
    // Override the display style to always use compact layout
    var displayStyle: SPDisplayStyle { .compact }

    // Restrict the picker to only show SF Symbols
    var supportedTypes: [SPPageType] { [.symbol] }

    // Customize the color picker's palette
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
Methods that return specific configuration objects for various sub-components.

- ``SymbolPicker/SymbolPickerConfiguration/presentationConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/colorPickerConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/optionListConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/selectionPreviewConfiguration()``

### Convenience Accessors
Public properties that provide shortened syntax for accessing component configurations.

- ``SymbolPicker/SymbolPickerConfiguration/presentation``
- ``SymbolPicker/SymbolPickerConfiguration/colorPicker``
- ``SymbolPicker/SymbolPickerConfiguration/optionList``
- ``SymbolPicker/SymbolPickerConfiguration/selectionPreview``

### Layout & Spacing
Customizing the overall structure and dynamic dimensions of the picker.

- ``SymbolPicker/SymbolPickerConfiguration/insetViewsConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/insetViews``
- ``SymbolPicker/SymbolPickerConfiguration/spacingConfiguration()``
- ``SymbolPicker/SymbolPickerConfiguration/spacings``

### Global Properties
Properties that define the overall state and behavior of the picker.

- ``SymbolPicker/SymbolPickerConfiguration/displayStyle``
- ``SymbolPicker/SymbolPickerConfiguration/supportedTypes``
- ``SymbolPicker/SymbolPickerConfiguration/defaultType``
- ``SymbolPicker/SymbolPickerConfiguration/symbolVariant``
- ``SymbolPicker/SymbolPickerConfiguration/allowSearching``
