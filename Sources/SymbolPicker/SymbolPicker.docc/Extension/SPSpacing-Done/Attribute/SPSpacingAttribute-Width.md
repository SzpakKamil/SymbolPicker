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

The width of a component.

## Overview

The `width` attribute defines the horizontal size of a target component within `SymbolPicker`.

### Layout Role

- **Symbol and Emoji Cells**: This attribute sets the horizontal frame size to ensure icons match in width across grid layouts.
- **Color Picker Swatches**: This attribute determines the width of individual color selection elements.

### Grid Calculation

`SPColorPicker` and `SPOptionList` use the `width` attribute to calculate how many columns fit within the available screen width. You can change grid density by adjusting this value.

### Technical Context

The system applies width using the SwiftUI `.frame(width: value)` modifier. If you omit a width, the picker balances visibility and density for the current dynamic type size.
