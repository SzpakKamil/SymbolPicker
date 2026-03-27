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

Returns an ``SymbolPicker/SPSelectionPreviewConfiguration`` for the selection preview.

- Returns: A configuration object for the preview component.

## Overview

The `selectionPreviewConfiguration()` method sets the appearance and animation for the ``SymbolPicker/SPSelectionPreview``. This component displays the user's current choice.

### Features

- **Corner Radius**: Set the rounding for the preview item.
- **Scroll Animations**: On iOS 18+, use the `calculateOffset` and `calculateScale` closures to animate the preview based on scroll movement.

### Customization

```swift
func selectionPreviewConfiguration() -> SPSelectionPreviewConfiguration {
    SPSelectionPreviewConfiguration()
        .spSelectionPreviewCornerRadiusFactor(0.2)
        .spSelectionPreviewCalculateScale { geometry in
             return 1.2
        }
}
```
