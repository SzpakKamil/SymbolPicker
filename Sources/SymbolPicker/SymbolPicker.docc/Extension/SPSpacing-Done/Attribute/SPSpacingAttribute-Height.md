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

The height of the component.

## Overview

The `height` attribute is a fundamental layout property that defines the vertical size of a target component within the `SymbolPicker`.

### Layout Role

This attribute is primarily used by:
- **`SPSymbolView` and `SPEmojiView`**: Controls the vertical frame size, ensuring that icons are rendered at a consistent height within lists or grids.
- **Color Cells**: Determines the vertical space each color swatch consumes in the color picker grid.

### Dynamic Resolution

When a `SPSpacing` configuration is queried, the `height` value is resolved based on the provided ``SymbolPicker/SPSpacing/Sizing`` object. If no specific height is set, the picker will automatically resolve to its platform-specific default height for the current dynamic type size.

### Technical Context

Height is typically applied as a `maxWidth: .infinity` or a fixed frame depending on the component's internal layout logic (e.g., within a `VStack` or `LazyVGrid`).
