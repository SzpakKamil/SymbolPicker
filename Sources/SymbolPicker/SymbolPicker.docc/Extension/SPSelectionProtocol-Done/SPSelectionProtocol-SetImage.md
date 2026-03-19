# ``SymbolPicker/SPSelectionProtocol/setImage(_:)``

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

Updates the image data of the current selection.

- Parameter image: The new ``SymbolPicker/SPImage`` to set for the selection.

## Overview

The `setImage(_:)` method allows for updating the user-provided photo selection. It is a `mutating` requirement, typically implemented by structs like ``SymbolPicker/SPSelection``.

### Implementation Details

When `setImage(_:)` is called, the conforming type should update its internal image storage and set its selection type to image. This is primarily done during the photo picking process or when the user adjusts the crop/zoom of an already selected photo.

### UI Feedback

Setting a new image triggers a re-render of any UI components that observe the selection. This ensures that the user's latest photo choice is immediately visible in the picker's preview area and other relevant components.
