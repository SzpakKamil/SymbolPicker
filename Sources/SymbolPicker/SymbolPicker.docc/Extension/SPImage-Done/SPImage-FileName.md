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

The original name of the image asset.

## Overview

The `fileName` property stores a readable name for the image. While the ``SymbolPicker/SPImage/id`` identifies the asset internally, `fileName` provides context for you and your users.

### Source Examples

- **Remote URLs**: The property defaults to the last part of the URL, like `landscape.jpg`.
- **System Symbols**: The property stores the system name, such as `star.circle.fill`.
- **User Imports**: The property takes the name of the original file from the photo library.
