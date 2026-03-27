# ``SymbolPicker/SPColorPickerConfiguration/type``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

The arrangement of color cells.

## Overview

The `type` property sets whether colors appear in one row or a multi-line grid. It uses the `Direction` enum to control this layout.

### Layout Options

The `.row` layout lets users scroll horizontally through colors. This works well in toolbars and compact views. The `.grid` layout shows colors in multiple rows and columns, displaying the full palette at once.

### Automated Selection

SymbolPicker selects a layout based on how you show the picker. You can override this to fit your design. This ensures the color selection feels natural on any screen size.

### Example

```swift
let config = SPColorPickerConfiguration()
    .spColorPickerLayout(.grid)
```
