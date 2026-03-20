# ``SymbolPicker/SPImage``

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

A versatile data-driven model representing an image asset from diverse sources including remote URLs, system symbols, and local data.

## Overview

`SPImage` is a core component of the `SymbolPicker` package designed to handle pixel-based image data. It conforms to ``SymbolPicker/SPDataAsset``, allowing it to be managed by ``SymbolPicker/SPDataManager`` and displayed alongside symbols and emojis in a unified interface.

Beyond simple image storage, `SPImage` provides a robust architectural solution for:
- **Source Agnosticism**: A single model for remote assets, system-rendered icons, and local photo library data.
- **Local Persistence**: Automatically caches data in the `Application Support` directory to ensure offline availability and performance.
- **Interactive Layout**: Built-in support for zoom and offset properties, enabling "cropping" or alignment within the display container.
- **Lazy Data Loading**: Optimized `Codable` implementation that keeps data payloads lean while ensuring assets are portable across devices.

### Architectural Role

In the `SymbolPicker` ecosystem, `SPImage` bridges the gap between structured system assets (symbols and emojis) and custom user content. By abstracting the storage and rendering logic, it allows the picker to treat a high-resolution photograph or a remotely fetched icon with the same programmatic ease as an SF Symbol.

### Data Persistence Strategy

`SPImage` utilizes a "Sidecar Data" pattern for persistence. While the model instance contains light metadata (dimensions, offsets, timestamps), the heavy binary data is stored as a separate `.data` file in the user's `Application Support` directory. 
- **Efficiency**: Prevents large binary blobs from bloating the main application database or UserDefaults.
- **Reliability**: Decouples the lifecycle of the metadata from the physical file on disk.

### Rendering and Transformations

The model includes built-in state for ``SymbolPicker/SPImage/zoom`` and ``SymbolPicker/SPImage/offsetX`` / ``SymbolPicker/SPImage/offsetY``. These properties are utilized by the ``SymbolPicker/SPImageView`` to apply non-destructive transformations. This allows users to fine-tune the appearance of an image—such as centering a face or focusing on a specific icon detail—directly within the picker interface.

### Integration with SPSelection

When a user selects an image, it is typically wrapped in an ``SymbolPicker/SPSelection`` object. Because `SPImage` stores its own transformation state, these user adjustments are preserved and can be persisted as part of the user's selection history.

## Topics

### Identification & Metadata

- ``SymbolPicker/SPImage/id``
- ``SymbolPicker/SPImage/fileName``
- ``SymbolPicker/SPImage/createdAt``

### Transformation & Layout

- ``SymbolPicker/SPImage/zoom``
- ``SymbolPicker/SPImage/offsetX``
- ``SymbolPicker/SPImage/offsetY``
- ``SymbolPicker/SPImage/width``
- ``SymbolPicker/SPImage/height``

### Initialization

- ``SymbolPicker/SPImage/init(url:fileName:zoom:offsetX:offsetY:)``
- ``SymbolPicker/SPImage/init(systemName:)``
- ``SymbolPicker/SPImage/init(fileName:rawData:zoom:offsetX:offsetY:width:height:)``

### Platform & Validation

- ``SymbolPicker/SPImage/isAvailable()``
- ``SymbolPicker/SPImage/localURL``

### Rendering

- ``SymbolPicker/SPImage/asView()``
