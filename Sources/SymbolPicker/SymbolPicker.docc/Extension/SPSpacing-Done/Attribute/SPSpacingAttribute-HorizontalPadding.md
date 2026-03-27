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

Horizontal padding sets the space to the left and right of a component.

## Overview

Use `horizontalPadding` to define the leading and trailing space for a component in `SymbolPicker`.

### Layout Role

These margins align the content. You use them to keep the symbol grid away from the edges of a sheet or to stop color swatches from touching their container boundaries. Consistent horizontal spacing creates a balanced look across the entire picker.

### User Experience

Horizontal breathing room makes selection easier on touchscreens. While iOS benefits from wider margins, you can tighten these values on macOS to match a desktop aesthetic. Proper padding ensures the picker content remains accessible and visually centered.

### Technical Context

The library applies this value through SwiftUI's `.padding(.horizontal, value)` modifier. This occurs during the rendering of the component's container.
