# ``SymbolPicker/SPImage/asView()``

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

Returns a SwiftUI view that shows the image.

## Overview

The `asView()` method creates a rendering component for an `SPImage`. It handles background loading, keeps the correct aspect ratio, and applies your layout changes.

### Rendering Steps

The method returns an ``SymbolPicker/SPImageView`` that follows these steps:
1. **Load from Disk**: The view uses `AsyncImage` to pull pixel data from the ``SymbolPicker/SPImage/localURL``. 
2. **Scale to Fit**: `GeometryReader` finds the available space. The view then calculates a scale that fills the area without stretching the image. It uses the `width` and `height` properties to find the right ratio.
3. **Apply Changes**: The view applies your ``SymbolPicker/SPImage/zoom`` and ``SymbolPicker/SPImage/offsetX`` / ``SymbolPicker/SPImage/offsetY`` settings.

### Performance

Since `asView()` runs on the `@MainActor`, you can use it directly in your SwiftUI `body`. The system handles heavy tasks like image decoding and file reading on background threads. This keeps the `SymbolPicker` grid smooth and responsive.
