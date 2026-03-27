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

A model that represents an image from a URL, system symbol, or local data.

## Overview

`SPImage` handles pixel-based images in the `SymbolPicker` package. It conforms to ``SymbolPicker/SPDataAsset``, so you can manage it with ``SymbolPicker/SPDataManager`` alongside symbols and emojis.

### Key Features

`SPImage` offers a complete solution for custom assets:
- **Universal Support**: Use one model for remote images, system icons, and photo library content.
- **Local Storage**: The app caches data in `Application Support` for offline use and speed.
- **Interactive Edits**: You can zoom and offset images to "crop" them within the picker.
- **Smart Loading**: The `Codable` design keeps data small and portable.

### Architecture

In the `SymbolPicker` ecosystem, `SPImage` connects system assets (symbols and emojis) with your custom content. It abstracts storage and rendering, so you can treat a high-resolution photo or a remote icon just like an SF Symbol.

### Persistence

The model uses a "Sidecar Data" pattern. The instance holds light metadata (size, offsets, dates), but the heavy binary data lives in a separate `.data` file. 
- **Efficiency**: Large blobs won't bloat your database or `UserDefaults`.
- **Safety**: The metadata stays separate from the physical file.

### Editing and Views

The model stores ``SymbolPicker/SPImage/zoom`` and ``SymbolPicker/SPImage/offsetX`` / ``SymbolPicker/SPImage/offsetY`` values. The ``SymbolPicker/SPImageView`` uses these to apply non-destructive changes. You can center a face or focus on an icon detail without changing the original file.

### Selection Integration

When you select an image, the app wraps it in an ``SymbolPicker/SPSelection``. Since `SPImage` tracks its own transformation state, the picker preserves your adjustments in the selection history.

## Topics

### Metadata

- ``SymbolPicker/SPImage/id``
- ``SymbolPicker/SPImage/fileName``
- ``SymbolPicker/SPImage/createdAt``

### Layout

- ``SymbolPicker/SPImage/zoom``
- ``SymbolPicker/SPImage/offsetX``
- ``SymbolPicker/SPImage/offsetY``
- ``SymbolPicker/SPImage/width``
- ``SymbolPicker/SPImage/height``

### Creation

- ``SymbolPicker/SPImage/init(url:fileName:zoom:offsetX:offsetY:)``
- ``SymbolPicker/SPImage/init(systemName:)``
- ``SymbolPicker/SPImage/init(fileName:rawData:zoom:offsetX:offsetY:width:height:)``

### Files

- ``SymbolPicker/SPImage/isAvailable()``
- ``SymbolPicker/SPImage/localURL``

### UI

- ``SymbolPicker/SPImage/asView()``
