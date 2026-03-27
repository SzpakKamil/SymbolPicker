# ``SymbolPicker/SPSpacing/Attribute/verticalPadding``

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

Vertical padding sets the space above and below a component.

## Overview

You use `verticalPadding` to define the space at the top and bottom of a component in `SymbolPicker`.

### Layout Role

This attribute separates interface elements. Use it to pull the search bar away from the symbol grid or to give headers and footers room. Clear vertical distance keeps the interface scannable and prevents the UI from feeling cramped.

### User Experience

Proper spacing protects interactive areas. It prevents users from accidentally tapping a neighboring symbol when they mean to pick a color. Balanced padding helps the eye distinguish between different sections of the picker.

### Technical Context

The library applies this value through SwiftUI's `.padding(.vertical, value)` modifier. It affects the container holding the target component.
