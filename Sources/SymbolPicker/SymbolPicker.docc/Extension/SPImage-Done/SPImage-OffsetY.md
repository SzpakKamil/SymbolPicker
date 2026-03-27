# ``SymbolPicker/SPImage/offsetY``

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

The vertical shift for the image.

## Overview

The `offsetY` property sets the vertical position of an image within its container.

### Panning and Zooming

This property works with ``SymbolPicker/SPImage/offsetX`` and ``SymbolPicker/SPImage/zoom`` to enable the "pan and zoom" system. You use these values to align or crop an image exactly how you want it.

### Coordinates

You measure `offsetY` in points. It represents the distance from the center of the container.

### User Interaction

The ``SymbolPicker/SPImageView` uses this property to position the image vertically. As you drag the image, the picker updates this value in real time. The app then saves these adjustments into the asset's metadata.

### Persistence

The `Codable` nature of `offsetY` ensures your alignment settings stay consistent. The picker restores these values every time you open the app.
