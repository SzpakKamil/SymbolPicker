# ``SymbolPicker/SPImageView``

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

A high-performance asynchronous view for rendering custom pixel-based image assets with advanced transformation support.

## Overview

`SPImageView` is a specialized rendering component designed for custom images within the ``SymbolPicker`` package. It uses the `AsyncImage` API to efficiently load and render pixel-based assets from local URLs, while providing sophisticated control over how the image is positioned and scaled within its container.

### Usage

To use `SPImageView`, initialize it with an instance of ``SymbolPicker/SPImage``:

```swift
import SwiftUI
import SymbolPicker

struct MyImagePreview: View {
    // Using the system symbol initializer
    let image = SPImage(systemName: "photo.artframe")

    var body: some View {
        if let image {
            SPImageView(image: image)
                .frame(width: 200, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
```

### Advanced Transformation Logic

The view incorporates a complex layout engine that calculates the image's final appearance based on several factors:
- **Aspect Ratio Maintenance**: Automatically calculates the image's original aspect ratio using its width and height to ensure that it is never distorted.
- **Dynamic Zooming**: Supports a `zoom` factor that scales the image while maintaining its centered focus within the container.
- **Precision Offsets**: Provides `offsetX` and `offsetY` controls that allow the user to precisely position the image within its frame, taking into account the scaled dimensions.
- **Intelligent Scaling**: Uses a combination of `.resizable()` and `.scaledToFill()` with custom offsets and scale effects to provide a high-fidelity rendering.

### Performance and Reliability

`SPImageView` is built for performance and reliability:
- **Asynchronous Loading**: Uses `AsyncImage` to ensure that the UI thread remains responsive while images are being loaded from disk.
- **Error Handling**: Provides an automatic fallback to a standard "photo" system icon if the image fails to load or if the provided URL is invalid.
- **Dynamic Identification**: Automatically re-renders when the underlying ``SymbolPicker/SPImage/id`` changes, ensuring that the view always matches the current state.

### Accessibility

The view automatically applies appropriate accessibility labels (via ``SymbolPicker/SPPageType/image``) and traits, ensuring that custom images are navigable and identifiable within the picker interface.

### Rendering Performance

Because custom images can be resource-intensive, `SPImageView` combines asynchronous loading with the `.drawingGroup()` modifier. This ensures that the main thread stays clear for user interactions while the GPU handles the complex image transformations and final composition.

## Topics

### Initialization

- ``SymbolPicker/SPImageView/init(image:)``
