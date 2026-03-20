# ``SymbolPicker/SPImageView/init(image:)``

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

Initializes a new image view with a provided image model.

## Overview

The `init(image:)` initializer creates a reactive rendering component for a specific pixel-based image asset.

### Parameter Configuration

- **`image`**: The ``SymbolPicker/SPImage`` data model containing the image's URL, dimensions, and transformation rules.

### Initialization Process

Upon initialization, the view stores the provided ``SymbolPicker/SPImage`` model. All complex rendering logic—including asynchronous loading via `AsyncImage`, calculating render dimensions from ``SymbolPicker/SPImage/width`` and ``SymbolPicker/SPImage/height``, and applying zoom and offset transformations—is handled during the view's layout phase.
