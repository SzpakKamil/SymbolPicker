# ``SymbolPicker/SPSelection/SelectionType/image``

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

A selection type for photos and images.

## Overview

Setting the `type` of an ``SymbolPicker/SPSelection`` to `.image` activates the ``SymbolPicker/SPSelection/image`` property. Use this type for photos from the user's library.

### Customization

Unlike symbols or emojis, `.image` selections allow adjustments.
- **Positioning**: Users change the image scale and offset to frame content.
- **Styling**: The system syncs the selection color to the image's average color for a consistent look.

### Data Handling

- The `image` property holds the ``SymbolPicker/SPImage`` asset.
- The `asView()` method uses ``SymbolPicker/SPImageView`` and applies scale and offset values.
- The system saves the image identifier, adjustments, and color when encoding.

### UI Integration

SymbolPicker shows an image browser for this type. Users pick from a grid of available photos.
