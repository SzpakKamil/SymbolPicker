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

Displays colors in a multi-line grid.

## Overview

In `.grid` mode, the color picker shows multiple rows. This layout works for large palettes where you want to see all options without scrolling.

### Characteristics

- **Visibility**: Users see more colors at once than in a row layout.
- **Scaling**: The number of rows changes based on the container width.

### Use Case

Use this for full-screen sheets and detail views with vertical space.
