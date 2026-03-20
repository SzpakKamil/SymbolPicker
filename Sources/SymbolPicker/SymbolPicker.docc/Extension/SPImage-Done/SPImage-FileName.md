# ``SymbolPicker/SPImage/fileName``

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

The original filename or system name of the image asset.

## Overview

The `fileName` property stores a human-readable name for the image. Unlike the ``SymbolPicker/SPImage/id``, which is an internal identifier, the `fileName` is intended to provide meaningful context to the user.

### Source Integration

- **Remote URLs**: When using the remote initializer, this property defaults to the last path component of the URL (e.g., `landscape.jpg`).
- **System Symbols**: When converting a symbol to an `SPImage`, this property stores the system name (e.g., `star.circle.fill`).
- **User Imports**: When selecting an image from the photo library, this property is populated with the name of the original file.
