# ``SymbolPicker/SPSpacing/Attribute/width``

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

The width of the component.

## Overview

The `width` attribute is a fundamental layout property that defines the horizontal size of a target component within the `SymbolPicker`.

### Layout Role

This attribute is primarily used by:
- **Symbol and Emoji Cells**: Controls the horizontal frame size, ensuring that icons are rendered at a consistent width within grid layouts.
- **Color Picker Swatches**: Determines the width of individual color selection elements.

### Grid Calculation

In the `SPColorPicker` and `SPOptionList`, the `width` attribute is used by the system to calculate how many columns can fit within the available screen width. Adjusting this value can effectively change the density of the grid.

### Technical Context

Width is typically applied using SwiftUI's `.frame(width: value)` modifier. If no width is specified in the configuration, the system defaults to a value that balances visibility with content density for the current dynamic type size.
