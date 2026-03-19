# ``SymbolPicker/SPEmoji``

A data model representing a Unicode emoji, complete with skin tone variations, versioning, and availability checks.

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

The `SPEmoji` structure is a core data model in `SymbolPicker` that encapsulates all necessary information about a Unicode emoji. Beyond just holding the character string, it provides robust support for skin tones, categorization, and platform-specific availability checks to ensure emojis render correctly on the user's device.

### Core Features

- **Identification**: Uses a hexcode string (e.g., "1F600") as its unique identifier.
- **Skin Tone Support**: Manages an array of skin tone variations (``SymbolPicker/SPEmoji/Skin``) and a `tone` index to control the current selection.
- **Availability Checks**: Includes sophisticated logic to verify if an emoji is supported on the current OS version, preventing the display of "question mark boxes" for newer emojis on older systems.
- **Rendering**: Provides helper methods to generate the correct display string based on the selected skin tone.

### Conformance

`SPEmoji` conforms to standard Swift protocols for seamless integration with SwiftUI and data handling:
- **Identifiable**: Unique identification for lists and collections.
- **Sendable**: Safe for concurrent execution.
- **Codable**: Custom encoding and decoding to handle complex nested structures like skin tones.
- **SPDataAsset**: Conforms to the library's base asset protocol.

## Topics

### Properties

- ``SymbolPicker/SPEmoji/id``
- ``SymbolPicker/SPEmoji/annotation``
- ``SymbolPicker/SPEmoji/version``
- ``SymbolPicker/SPEmoji/category``
- ``SymbolPicker/SPEmoji/subcategory``
- ``SymbolPicker/SPEmoji/tags``
- ``SymbolPicker/SPEmoji/skins``
- ``SymbolPicker/SPEmoji/tone``

### Initialization

- ``SymbolPicker/SPEmoji/init(_:)``
- ``SymbolPicker/SPEmoji/init(id:version:category:annotation:subcategory:tags:skins:tone:)``

### Nested Types

- ``SymbolPicker/SPEmoji/Skin``

### Core Functionality

- ``SymbolPicker/SPEmoji/isAvailable()``
- ``SymbolPicker/SPEmoji/emojiString()``
- ``SymbolPicker/SPEmoji/asView()``
- ``SymbolPicker/SPEmoji/fetchAssets(locale:)``

### Static Helpers

- ``SymbolPicker/SPEmoji/isEmojiRenderable(_:)``
- ``SymbolPicker/SPEmoji/filePrefix``
