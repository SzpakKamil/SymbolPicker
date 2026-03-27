# ``SymbolPicker/SPSpacing/Attribute/height``

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

The height of a component.

## Overview

The `height` attribute defines the vertical size of a target component within `SymbolPicker`.

### Layout Role

- **`SPSymbolView` and `SPEmojiView`**: This attribute sets the vertical frame size to ensure icons match in height across lists or grids.
- **Color Cells**: This attribute determines the vertical space each color swatch occupies in the color picker grid.

### Resolution

The picker resolves the `height` value based on the ``SymbolPicker/SPSpacing/Sizing`` object. If you do not specify a height, the system uses the default height for the current dynamic type size and platform.

### Technical Context

The layout engine applies height as a fixed frame or within a `VStack` or `LazyVGrid` depending on the component requirements.
