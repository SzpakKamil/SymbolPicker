# ``SymbolPicker/SPSpacing/Attribute/horizontalPadding``

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

Horizontal padding around the component.

## Overview

The `horizontalPadding` attribute defines the amount of horizontal space (leading and trailing) added around a target component within the `SymbolPicker`.

### Layout Role

This attribute is essential for:
- **Option List Alignment**: Ensures that symbol and emoji grids have consistent margins relative to the edges of the sheet or window.
- **Color Picker Spacing**: Controls the separation between color swatches and the edges of their container, preventing them from feeling cramped against the UI boundaries.

### End-User Impact

Proper horizontal padding ensures that the picker content feels balanced and accessible. On platforms with touch interfaces, it provides necessary breathing room for easier selection, while on macOS, it allows for a more compact and desktop-native aesthetic.

### Technical Context

This value is applied internally using SwiftUI's `.padding(.horizontal, value)` modifier during the rendering of the component's container.
