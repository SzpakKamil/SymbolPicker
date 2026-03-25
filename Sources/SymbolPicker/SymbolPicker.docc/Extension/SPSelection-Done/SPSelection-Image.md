# ``SymbolPicker/SPSelection/image``

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

The custom image asset for the selection.

## Overview

When the selection ``SymbolPicker/SPSelection/type`` is set to ``SymbolPicker/SPSelection/SelectionType/image``, this property holds the current custom image asset (via ``SymbolPicker/SPImage``).

### Data Access

This property is private(set), so all updates to it must be made through the ``SymbolPicker/SPSelection/setImage(_:)`` method. This ensures that the selection type is updated to `.image` correctly.

### Encoding and Decoding

The image data is encoded into the `image` key during persistence. The encoding logic typically saves the unique identifier or the underlying data for the image, allowing for consistent restoration between application sessions.
