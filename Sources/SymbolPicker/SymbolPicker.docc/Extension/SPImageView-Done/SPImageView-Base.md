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

A view for rendering image assets with transformation support.

## Overview

`SPImageView` renders images in the ``SymbolPicker`` package. It uses `AsyncImage` to load assets from URLs and provides controls to position and scale the image.

### Usage

Initialize `SPImageView` with an ``SymbolPicker/SPImage``:

```swift
import SwiftUI
import SymbolPicker

struct MyImagePreview: View {
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

### Transformation Logic

The view calculates the final look using several factors:
- **Aspect Ratio**: Uses width and height to prevent distortion.
- **Zoom**: Scales the image while keeping it centered.
- **Offsets**: Uses `offsetX` and `offsetY` to position the image.
- **Scaling**: Combines `.resizable()` and `.scaledToFill()` with custom effects.

### Performance

`SPImageView` keeps the UI responsive:
- **Background Loading**: `AsyncImage` loads images without blocking the main thread.
- **Fallbacks**: Shows a "photo" icon if loading fails or the URL is invalid.
- **Re-rendering**: Updates automatically when the ``SymbolPicker/SPImage/id`` changes.

### Accessibility

The view applies labels and traits via ``SymbolPicker/SPPageType/image``. Users can identify and navigate images within the picker.

### Rendering

The view uses the `.drawingGroup()` modifier. This lets the GPU handle transformations and composition, leaving the main thread free for interaction.

## Topics

### Initialization

- ``SymbolPicker/SPImageView/init(image:)``
