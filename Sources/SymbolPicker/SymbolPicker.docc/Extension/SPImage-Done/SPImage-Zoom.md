# ``SymbolPicker/SPImage/zoom``

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

The scaling factor applied to the image.

## Overview

The `zoom` property defines the scale level for an `SPImage` asset within its rendering container. A value of `1.0` (the default) indicates that the image fits the container according to the layout rules, while higher values allow the user to "zoom in" on specific details of the pixel data.

### Interactive Layout Context

This property is a foundational element of the `SymbolPicker`'s interactive image editing capabilities. When combined with ``SymbolPicker/SPImage/offsetX`` and ``SymbolPicker/SPImage/offsetY``, the `zoom` property allows users to create a custom "crop" or "view" of an image asset without destructive editing of the source binary data.

### Implementation Logic

The ``SymbolPicker/SPImageView`` utilizes the `zoom` property as a direct input for the SwiftUI `.scaleEffect()` modifier. The scaling is typically centered on the container, and the combined effect of the zoom and the offset creates a flexible and intuitive pan-and-zoom interface.

### Persistence

Because `zoom` is a `Codable` property, any adjustment made by the user is preserved when the `SPImage` is saved as part of an ``SymbolPicker/SPSelection``. This ensures that the user's specific view of an image is maintained across app launches.
