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

- **Component Styles**: Granular control over the appearance of the ``SymbolPicker/SPOptionList``, ``SymbolPicker/SPColorPicker``, and ``SymbolPicker/SPSelectionPreview``.
- **Layout System**: A powerful ``SymbolPicker/SPInsetedView`` system for placing custom UI elements into predefined slots defined by ``SymbolPicker/SPViewPlacementType``.
- **Spacing**: Dynamic, type-size-aware ``SymbolPicker/SPSpacing`` dimensions for all picker components.
- **Global Behavior**: Controls for supported ``SymbolPicker/SPPageType`` asset types (Symbols, Emojis, and User Photos), default page, searching, and ``SymbolPicker/SPSymbol/Variant`` variants.

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
