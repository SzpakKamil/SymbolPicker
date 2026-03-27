# ``SymbolPicker/SPImage/height``

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

The pixel height of the image asset.

## Overview

The `height` property stores the original height of the image data in pixels. 

### Performance

The app calculates this value during initialization. `SPImage` uses `CGImageSource` to read the height from the file header (JPEG, PNG, or HEIC) without loading the full image into memory. This saves resources while providing the UI with needed metadata.

### Layout and Aspect Ratio

The ``SymbolPicker/SPImageView`` uses this property along with ``SymbolPicker/SPImage/width`` to:
1. **Maintain Aspect Ratio**: The view scales the image correctly to avoid stretching.
2. **Optimize Fit**: The view decides whether to use aspect fill or aspect fit based on the image's orientation.

### Immutability

The `height` property reflects the source data and never changes during the asset's life.
