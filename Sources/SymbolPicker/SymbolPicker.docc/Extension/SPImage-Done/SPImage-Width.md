# ``SymbolPicker/SPImage/width``

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

The pixel width of the image asset.

## Overview

The `width` property stores the original width of the image data in pixels. 

### Efficiency

The app finds this value during initialization. `SPImage` uses `CGImageSource` to read the width from the file header (JPEG, PNG, or HEIC) without loading the whole image. This provides the layout engine with metadata while using minimal memory.

### Rendering and Aspect Ratio

The ``SymbolPicker/SPImageView`` needs this property and the ``SymbolPicker/SPImage/height`` to:
1. **Prevent Distortion**: The view calculates the correct scaling factor to keep the original aspect ratio.
2. **Choose Fit**: The view determines if the image is landscape, portrait, or square to optimize the display.

### Immutability

The `width` property represents the source data and never changes.
