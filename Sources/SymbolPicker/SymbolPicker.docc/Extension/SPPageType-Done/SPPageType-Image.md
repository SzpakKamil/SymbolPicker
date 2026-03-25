# ``SymbolPicker/SPPageType/image``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(macOS, introduced: "14.0")
    @Available(visionOS, introduced: "26.0")
    @DocumentationExtension(mergeBehavior: override)
}

A browsing page for custom images from the Photos library.

## Overview

The `image` case represents a page in the `SymbolPicker` where users can select personal photos or custom assets. It provides a rich interface for integration with the system Photos library on supported platforms.

### Photos Library Integration

When active, this page utilizes `PhotosUI` to allow users to securely pick images from their device. This is ideal for:
- **Personalization**: Letting users use their own photos as app icons or category markers.
- **Custom Assets**: Bridging the gap between system symbols and user-provided content.

### User Adjustments

The picker provides a specialized interface for fine-tuning the selected image:
- **Scale**: Users can zoom in or out to focus on a specific part of the image.
- **Offset**: Users can adjust the X and Y positions to center the desired content perfectly within the selection frame.

### Automatic Color Synchronization

Selecting an image from the Photos library triggers an automatic color update. The library calculates the **average color** of the chosen image and applies it to the selection's color property. This ensures that UI elements derived from the selection color (like backgrounds or accents) remain visually harmonious with the new image.
