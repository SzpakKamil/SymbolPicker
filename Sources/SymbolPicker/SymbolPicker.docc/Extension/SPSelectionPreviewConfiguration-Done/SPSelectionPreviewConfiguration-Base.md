# ``SymbolPicker/SPSelectionPreviewConfiguration``

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
    @AutomaticArticleSubheading(disabled)
}

Configures the look and animation of the selection preview area.

## Overview

`SPSelectionPreviewConfiguration` sets the properties for the hero preview at the top of the picker.

### Integration

The ``SymbolPicker/SPSelectionPreview`` view uses this configuration to:
- **Set Shape**: The ``selectionPreviewCornerRadiusFactor`` property sets the rounding for the preview. A factor of 1.0 creates a circle, while lower values create rounded rectangles.
- **Animate Scrolling**: On iOS 26.0+, the preview area can shift its scale and offset as users scroll.
    - **Scale**: Use ``calculateScale`` to shrink or grow the preview.
    - **Offset**: Use ``calculateOffset`` to create "sticky" header or parallax effects.

### Example

```swift
let configuration = SPSelectionPreviewConfiguration()
    .spSelectionPreviewCornerRadiusFactor(0.4)
    .spSelectionPreviewCalculateScale { geometry in
        // Return scale based on scroll geometry
        return 1.0
    }
```

## Topics

### Sizing & Shape
- ``SymbolPicker/SPSelectionPreviewConfiguration/selectionPreviewCornerRadiusFactor``

### Dynamic Animations
- ``SymbolPicker/SPSelectionPreviewConfiguration/calculateScale``
- ``SymbolPicker/SPSelectionPreviewConfiguration/calculateOffset``

### Modification Methods
- ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCornerRadiusFactor(_:)``
- ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCalculateOffset(_:)``
- ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCalculateScale(_:)``
