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

The intrinsic pixel height of the image asset.

## Overview

The `height` property stores the original pixel height of the binary image data. 

### Automated Resolution

This property is typically calculated during the model's initialization phase. By using `CGImageSource`, `SPImage` resolves the actual height from the binary image stream (JPEG, PNG, HEIC) without fully decoding the pixel data into memory. This provides the UI with the necessary layout metadata with minimal memory overhead.

### Role in Layout and Aspect Ratio

Along with ``SymbolPicker/SPImage/width``, this property is critical for the ``SymbolPicker/SPImageView`` rendering pipeline. It allows the view to:
1. **Maintain Aspect Ratio**: Prevent image distortion by calculating the correct scaling factor for the rendering container.
2. **Optimize Rendering**: Determine the initial fit (aspect fill vs aspect fit) based on the image's orientation (landscape, portrait, or square).

### Immutability

The intrinsic `height` is a core property of the binary data and remains immutable for the life of the asset.
