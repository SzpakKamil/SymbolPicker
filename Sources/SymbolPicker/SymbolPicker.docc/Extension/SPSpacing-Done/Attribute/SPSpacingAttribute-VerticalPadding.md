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

Vertical padding around the component.

## Overview

The `verticalPadding` attribute defines the amount of vertical space (top and bottom) added around a target component within the `SymbolPicker`.

### Layout Role

This attribute is primarily used for:
- **Component Separation**: Provides visual distance between different parts of the picker, such as separating the search bar from the symbol grid.
- **Section Integrity**: Ensures that headers and footers within the scrollable content have adequate spacing to clearly define their relationship to the data assets.

### End-User Impact

Correct vertical padding prevents different parts of the UI from blending together, improving scannability. It also ensures that interactive elements like the color picker have enough space around them to prevent accidental taps on neighboring symbols or emojis.

### Technical Context

This value is applied internally using SwiftUI's `.padding(.vertical, value)` modifier during the rendering of the component's container.
