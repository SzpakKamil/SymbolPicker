# ``SymbolPicker/SymbolPickerConfiguration/selectionPreviewConfiguration()``

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


Returns an ``SymbolPicker/SPSelectionPreviewConfiguration`` for the ``SymbolPicker/SPSelectionPreview`` component.

- Returns: A configuration object for the selection preview component.

## Overview

The `selectionPreviewConfiguration()` method defines the appearance and dynamic animation behaviors of the ``SymbolPicker/SPSelectionPreview`` that displays the currently selected asset.

### Features

- **Corner Radius**: Control the rounding of the preview item.
- **Scroll Geometry Animations**: On iOS 18+, use ``SPSelectionPreviewConfiguration/calculateOffset`` and ``SPSelectionPreviewConfiguration/calculateScale`` closures to define custom animations driven by scroll movement.

### Customization

```swift
func selectionPreviewConfiguration() -> SPSelectionPreviewConfiguration {
    SPSelectionPreviewConfiguration()
        .spSelectionPreviewCornerRadiusFactor(0.2)
        .spSelectionPreviewCalculateScale { geometry in
             // Custom scale logic based on scroll geometry
             return 1.2
        }
}
```
