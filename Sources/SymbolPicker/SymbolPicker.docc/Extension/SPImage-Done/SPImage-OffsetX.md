# ``SymbolPicker/SPImage/offsetX``

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

The horizontal translation applied to the image.

## Overview

The `offsetX` property defines the horizontal offset of the image asset within its rendering container.

### Interactive Layout Role

The `offsetX` property, along with ``SymbolPicker/SPImage/offsetY`` and ``SymbolPicker/SPImage/zoom``, forms the basis of the `SymbolPicker`'s "pan and zoom" layout system. These properties allow the user to precisely align or "crop" an image asset for optimal presentation.

### Coordinate System

The `offsetX` is measured in points and represents the translation from the container's center. 

### Implementation Logic

The ``SymbolPicker/SPImageView`` utilizes the `offsetX` property to set the horizontal position of the image within its container. This property is modified as the user interacts with the image via pan gestures, allowing for real-time adjustments that are saved as part of the asset metadata.

### Persistence and State

Because `offsetX` is a `Codable` property, user-specified alignment is maintained across app sessions, ensuring a consistent visual experience.
