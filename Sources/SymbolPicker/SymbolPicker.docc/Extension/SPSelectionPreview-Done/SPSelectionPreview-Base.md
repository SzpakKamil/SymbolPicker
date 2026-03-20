# ``SymbolPicker/SPSelectionPreview``

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

A high-fidelity preview component that displays the currently selected symbol, emoji, or image.

## Overview

`SPSelectionPreview` is a reactive component designed to give users immediate visual feedback as they interact with the `SymbolPicker`. It dynamically resolves and renders the active selection, taking into account current variant styles and color tints.

### Intelligent Rendering

The preview component is more than just a static display; it incorporates sophisticated layout and color logic:
- **Color Contrast Optimization**: When a custom tint color is selected, the preview automatically calculates the color's luminance. It then intelligently switches the icon's foreground color (e.g., to black or white) to maintain maximum readability against the tinted background.
- **Source-Aware Layout**: Automatically handles the rendering differences between vector symbols, text-based emojis, and pixel-based images.
- **Aesthetic Depth**: Utilizes linear gradients, shadows, and rounded corners to provide a modern, tactile feel to the selected asset.

### Platform-Native Experiences

The component adapts its visual language to fit each platform's unique characteristics:
- **iOS/visionOS**: On supported modern versions (iOS 26+), the preview integrates with scroll geometry to provide dynamic scaling and vertical parallax offsets.
- **watchOS**: Renders as a circular preview, optimized for the small form factor.
- **tvOS**: Becomes a focusable element that provides visual feedback (scaling and animations) when highlighted via the Siri Remote.

### Integration

To include the selection preview, simply add it to your `SymbolPicker` body. It will automatically resolve the current selection from the environment.

```swift
SPSelectionPreview()
```

### Inset helper

The `asInsetView()` method provides a pre-configured ``SymbolPicker/SPInsetedView`` wrapper. 
- On **iOS/macOS/visionOS/tvOS 26+**: Positions the preview at ``SymbolPicker/SPInsetedView/Placement/safeAreaTop`.
- On **iOS/macOS/visionOS/tvOS pre 26**: Positions the preview at ``SymbolPicker/SPInsetedView/Placement/scrollContentTop`.
- On **watchOS**: Places the preview in the ``SymbolPicker/SPInsetedView/Placement/toolbarBottomTralling``.

## Topics

### Initialization

- ``SymbolPicker/SPSelectionPreview/init()``

### Supporting Types

- ``SymbolPicker/SPSelectionPreviewConfiguration``
