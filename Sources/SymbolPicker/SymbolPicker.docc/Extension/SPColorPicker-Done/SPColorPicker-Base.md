# ``SymbolPicker/SPColorPicker``

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

A component for selecting colors and tinting assets.

## Overview

`SPColorPicker` lets users select colors to tint SF Symbols and customize app aesthetics.

### Configuration

The environment's ``SymbolPicker/SPColorPickerConfiguration`` set the layout and behavior. This configuration supports:
- **Layouts**: Use `.grid` for multi-line displays or `.row` for horizontal scrolling.
- **Custom Colors**: Add a "rainbow" cell to open the system's native color picker.
- **Dynamic Sizing**: Color cells adjust based on platform and dynamic type settings.

### Platform Adaptation

The view adjusts to every Apple platform:
- **iOS, macOS, and visionOS**: The picker uses a glass material container.
- **watchOS**: The picker opens a full-screen selection sheet from a button.
- **tvOS**: Use focus-based interactions to highlight the selected color.

### State Management

`SPColorPicker` links to the ``SymbolPicker/SPSelection`` environment. Picking a color updates the shared state and re-renders the preview with the new tint.

## Topics

### Initialization
- ``SymbolPicker/SPColorPicker/init()``

### Supporting Types
- ``SymbolPicker/SPColorPickerConfiguration``
