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

Retrieves the custom image data associated with the current selection.

- Returns: An ``SymbolPicker/SPImage`` if the selection contains a custom photo; otherwise, `nil`.

## Overview

The `getImage()` method provides access to any custom photo data that the user has selected via the system's PhotosPicker. It is only applicable when the selection type represents a user-provided image rather than a system symbol or emoji.

### Data Structure

The returned ``SymbolPicker/SPImage`` object contains the raw image data along with metadata like file name, dimensions, and user-defined zoom and offset values. This detailed information allows the package to correctly render and crop the image for display.

### Use Cases

- **Image Preview**: Used by ``SymbolPicker/SPImageView`` to display the selected photo within the picker's UI.
- **Image Editing**: Used by components that allow users to adjust the zoom and position of their selected photos.
- **Persistence**: Can be used by hosting applications to extract and save the raw data of the user's custom photo selection.
