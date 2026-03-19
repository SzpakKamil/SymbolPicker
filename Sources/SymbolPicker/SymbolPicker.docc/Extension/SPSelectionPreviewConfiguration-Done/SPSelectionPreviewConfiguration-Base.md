# ``SymbolPicker/SPSelectionPreviewConfiguration``

A struct that configures the visual presentation and animation of the selection preview area.

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

## Overview

The `SPSelectionPreviewConfiguration` struct provides customization for the area that displays the current selection at the top of the picker.

### View Integration

This configuration is primarily used by the ``SymbolPicker/SPSelectionPreview`` view.

- **Visual Appearance**: The ``selectionPreviewCornerRadiusFactor`` property determines the shape of the large preview (e.g., a circle with a factor of 1.0 or a rounded rectangle with a lower factor).
- **Dynamic Scroll Animations**: On platforms that support scroll geometry (iOS 26.0+, etc.), the preview area can dynamically adjust its scale and vertical offset as the user scrolls through the picker's asset list.
    - **Scale Dynamics**: Use ``calculateScale`` to define how much the preview should shrink or grow during scrolling.
    - **Offset Dynamics**: Use ``calculateOffset`` to define the vertical movement of the preview, typically used to create a "sticky header" effect.

### Usage Example

```swift
let configuration = SPSelectionPreviewConfiguration()
    .spSelectionPreviewCornerRadiusFactor(0.4)
    .spSelectionPreviewCalculateScale { geometry in
        // Custom scale logic based on scroll geometry
        return 1.0
    }
```

## Topics

### Sizing & Shape
Visual properties of the preview area.

- ``SymbolPicker/SPSelectionPreviewConfiguration/selectionPreviewCornerRadiusFactor``

### Dynamic Animations
Closures for controlling the preview's behavior during scrolling.

- ``SymbolPicker/SPSelectionPreviewConfiguration/calculateScale``
- ``SymbolPicker/SPSelectionPreviewConfiguration/calculateOffset``

### Modification Methods
Chainable methods for updating configuration properties.

- ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCornerRadiusFactor(_:)``
- ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCalculateOffset(_:)``
- ``SymbolPicker/SPSelectionPreviewConfiguration/spSelectionPreviewCalculateScale(_:)``
