# ``SymbolPicker/SPColorPickerConfiguration/Direction/row``

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

Displays color cells in a single horizontal row.

## Overview

When set to `.row`, the color picker presents its selection in a single, horizontally scrollable row. This layout consumes minimal vertical space, making it perfect for compact presentations or toolbars.

### Characteristics
- **Space Efficiency**: Occupies the minimum vertical height required by a color cell.
- **Navigation**: Supports standard horizontal scrolling if the number of colors exceeds the available width.

### Use Case
Ideal for compact sheets, popovers, or as an inline control within a larger interface.
