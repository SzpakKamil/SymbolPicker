# ``SymbolPicker/SPImage/zoom``

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

The scale factor for the image.

## Overview

The `zoom` property sets the scale level for an `SPImage` inside its container. A value of `1.0` fits the image to the container. Higher values let you zoom in on specific pixel details.

### Editing Images

This property powers the interactive image editor in `SymbolPicker`. When you combine `zoom` with ``SymbolPicker/SPImage/offsetX`` and ``SymbolPicker/SPImage/offsetY``, you create a custom crop. This happens without changing the original image data.

### Implementation

The ``SymbolPicker/SPImageView`` passes this value to the SwiftUI `.scaleEffect()` modifier. Scaling happens from the center of the container. The result is an intuitive pan-and-zoom interface for your users.

### Saving State

Since `zoom` conforms to `Codable`, the picker saves your adjustments automatically. Your specific view of the image persists across app launches as part of an ``SymbolPicker/SPSelection``.
