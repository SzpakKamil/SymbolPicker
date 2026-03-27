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

Creates an image view with an image model.

## Overview

The `init(image:)` initializer builds a rendering component for an image asset.

### Parameters

- **`image`**: The ``SymbolPicker/SPImage`` model with the URL, dimensions, and transformations.

### Process

The view stores the ``SymbolPicker/SPImage`` model. It handles loading through `AsyncImage` and calculates dimensions from ``SymbolPicker/SPImage/width`` and ``SymbolPicker/SPImage/height``. The view applies zoom and offset transformations during the layout phase.
