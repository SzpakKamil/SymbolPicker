# ``SymbolPicker/SPPageType/image``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(macOS, introduced: "14.0")
    @Available(visionOS, introduced: "26.0")
    @DocumentationExtension(mergeBehavior: override)
}

A browsing page for custom photos.

## Overview

The `image` case sets the picker to show personal photos or custom assets. It uses the system Photos library on supported platforms.

### Integration

This page uses `PhotosUI` to let users pick images securely. This helps users personalize the app by using their own photos as markers or icons.

### User Controls

The picker includes tools for adjusting the selected image:
- **Scale**: Users zoom the image to focus on a subject.
- **Offset**: Users move the image to center it within the selection frame.

### Color Sync

When a user picks a photo, the library calculates its average color. It then applies this color to the selection tint. This keeps your UI's backgrounds and accents consistent with the new image.
