# ``SymbolPicker/SymbolPickerConfiguration/spacingConfiguration()-1uh8x``

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

@Options {
    @AutomaticSeeAlso(disabled)
}

Returns an array of ``SymbolPicker/SPSpacing`` objects for picker components.

- Returns: A collection of spacing rules.

## Overview

The `spacingConfiguration()` method sets the size and padding of components based on the `DynamicTypeSize`. This ensures the picker remains readable and balanced regardless of the user's font settings.

### Component Spacings

Define spacings for:
- **`.optionList`**: Sets grid cell size and section padding.
- **`.colorPicker`**: Sets the size of color swatches.
- **`.previewSelection`**: Sets dimensions for the main selection preview.

### Customization

```swift
func spacingConfiguration() -> [SPSpacing] {
    SPSpacing(component: .optionList) { typeSize in
        // Custom dimensions based on dynamic type size
        return .init(width: 33.6, height: 37.5, horizontalPadding: 20, verticalPadding: 20)
    }
}
```
