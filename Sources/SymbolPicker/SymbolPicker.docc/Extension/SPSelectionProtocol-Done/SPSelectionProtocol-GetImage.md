# ``SymbolPicker/SPSelectionProtocol/getImage()``

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

Gets the custom image data for the selection.

- Returns: An ``SymbolPicker/SPImage`` if the selection contains a photo. Otherwise, returns `nil`.

## Overview

The `getImage()` method provides access to photos users select via the system's `PhotosPicker`. It only applies when the user chooses an image rather than a symbol or emoji.

### Data Structure

The returned ``SymbolPicker/SPImage`` object contains the raw data and metadata like dimensions, zoom, and offset. This information lets the library crop and render the photo correctly.

### Use Cases

- **Previews**: ``SymbolPicker/SPImageView`` uses this to show the photo in the picker.
- **Editing**: Use this to let users adjust the zoom and position of their photos.
- **Persistence**: Host apps use this to extract and save user photo data.
