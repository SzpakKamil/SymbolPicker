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

A unified color selection component for tinting symbols and customizing the picker's visual state.

## Overview

`SPColorPicker` is a highly adaptive UI component that provides users with an intuitive interface for selecting colors. It is primarily used within the `SymbolPicker` to apply color tints to SF Symbols, ensuring that the selected icon matches the user's aesthetic requirements.

### Configuration-Driven Layout

The appearance and behavior of the `SPColorPicker` are entirely determined by the ``SymbolPicker/SPColorPickerConfiguration`` provided through the environment. This configuration allows for:
- **Layout Versatility**: Support for both `.grid` (multi-line) and `.row` (single horizontal scroll) display modes.
- **Custom Color Integration**: Optionally includes a specialized "rainbow" cell that triggers the system's native color picker (e.g., `ColorPicker` in SwiftUI) for an infinite range of choices.
- **Dynamic Sizing**: Automatically adjusts the size of color cells based on the platform and current dynamic type settings.

### Platform and Aesthetic Adaptation

The view is designed to feel native on every Apple platform:
- **iOS/macOS/visionOS**: On supported operating systems (iOS 26+), the picker is automatically wrapped in a modern glass material container using `GlassEffectContainer`.
- **watchOS**: To conserve screen space, the picker renders as a primary button that presents a full-screen selection sheet.
- **tvOS**: Optimized for focus-based interaction, providing a clear visual indication of the currently highlighted color.

### State Management

`SPColorPicker` integrates directly with the ``SymbolPicker/SPSelection`` environment. When a color is selected, the view updates the shared selection state, which in turn triggers a re-render of the previewed asset with the new tint.

## Topics

### Initialization

- ``SymbolPicker/SPColorPicker/init()``

### Supporting Types

- ``SymbolPicker/SPColorPickerConfiguration``
