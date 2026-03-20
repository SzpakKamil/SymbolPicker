# ``SymbolPicker/SPColorPickerConfiguration/Direction/grid``

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

Displays color cells in a multi-line grid.

## Overview

When set to `.grid`, the color picker expands vertically to show multiple rows of color cells. This is ideal for detailed picker views or when a larger selection of colors is available, as it minimizes the need for horizontal scrolling.

### Characteristics
- **Visibility**: More colors are visible at once compared to a row layout.
- **Scaling**: Adapts its row count based on the available width of the picker container.

### Use Case
Recommended for full-screen sheets or detail views where vertical space is less constrained.
