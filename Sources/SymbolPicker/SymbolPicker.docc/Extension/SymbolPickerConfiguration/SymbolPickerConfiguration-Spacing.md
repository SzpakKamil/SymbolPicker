# ``SymbolPicker/SymbolPickerConfiguration/spacingConfiguration()``

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

Returns an array of ``SymbolPicker/SPSpacing`` objects defining the exact dimensions for different picker components.

- Returns: A collection of spacing rules.

## Overview

The `spacingConfiguration()` method defines the size and padding of components based on the user's current `DynamicTypeSize`. This ensures that the picker remains accessible and visually balanced regardless of the user's font settings.

### Component Spacings

Spacings can be defined for:
- **`.optionList`**: Controls the grid cell size and section paddings.
- **`.colorPicker`**: Controls the size of the color swatches.
- **`.previewSelection`**: Controls the dimensions of the hero selection preview.

### Customization

```swift
func spacingConfiguration() -> [SPSpacing] {
    SPSpacing(component: .optionList) { typeSize in
        // Return custom dimensions based on dynamic type size
        return .init(width: 24 * 1.4, height: 30 * 1.25, horizontalPadding: 20, verticalPadding: 20)
    }
}
```
