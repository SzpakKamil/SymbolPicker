# ``SymbolPicker/SPImage``

A model for handling user-imported and custom images, supporting local persistence and remote fetching.

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

## Overview

`SPImage` extends the capabilities of `SymbolPicker` beyond system assets, allowing users to select and manage custom images. It handles the full lifecycle of an image asset: fetching from a URL, saving to the device's file system, and serializing metadata for database storage.

### Core Features

- **Persistence**: Automatically manages binary data storage in the app's `Application Support` directory. The JSON representation (Codable) remains lightweight, containing only metadata and a reference to the local file.
- **Remote Loading**: Includes async initializers to safely download and cache images from web URLs.
- **Display Customization**: Supports `zoom` and offset (`offsetX`, `offsetY`) properties, allowing users to fine-tune how the image appears within the picker's frame.
- **System Integration**: Can also be initialized from a system symbol name, converting it into a static PNG asset.

### Conformance

- **Codable**: Implements custom encoding/decoding logic. On decode, it restores the binary file to disk if the payload contains raw data.
- **Identifiable**: Uses a UUID for robust identification.
- **Sendable**: Safe for use in Swift concurrency contexts.

## Topics

### Properties

- ``SymbolPicker/SPImage/id``
- ``SymbolPicker/SPImage/fileName``
- ``SymbolPicker/SPImage/createdAt``
- ``SymbolPicker/SPImage/width``
- ``SymbolPicker/SPImage/height``
- ``SymbolPicker/SPImage/zoom``
- ``SymbolPicker/SPImage/offsetX``
- ``SymbolPicker/SPImage/offsetY``
- ``SymbolPicker/SPImage/localURL``

### Initialization

- ``SymbolPicker/SPImage/init(url:fileName:zoom:offsetX:offsetY:)``
- ``SymbolPicker/SPImage/init(systemName:)``
- ``SymbolPicker/SPImage/init(fileName:rawData:zoom:offsetX:offsetY:width:height:)``

### Core Functionality

- ``SymbolPicker/SPImage/isAvailable()``
- ``SymbolPicker/SPImage/asView()``

### Static Helpers

- ``SymbolPicker/SPImage/filePrefix``
