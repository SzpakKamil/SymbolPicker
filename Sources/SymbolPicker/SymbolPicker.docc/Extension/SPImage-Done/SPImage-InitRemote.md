# ``SymbolPicker/SPImage/init(url:fileName:zoom:offsetX:offsetY:)``

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

Asynchronously fetches image data from a remote URL and initializes the instance.

## Overview

This initializer provides a high-level way to ingest external image assets into the `SymbolPicker` library. It handles the entire lifecycle of fetching, processing, and persisting remote data while ensuring memory and disk efficiency.

### Loading Pipeline

1. **Network Request**: Uses `URLSession.shared.data(from:)` to asynchronously download the binary data from the provided `url`.
2. **Status Validation**: Verifies that the server returns a successful HTTP status code (`200-299`).
3. **Memory-Efficient Dimension Extraction**: Instead of fully decoding the image into memory, this method uses `CGImageSourceCreateWithData` and `CGImageSourceCopyPropertiesAtIndex` to resolve the pixel width and height. This keeps the initial footprint small while still providing the layout engine with necessary aspect ratio data.
4. **Local Persistence**: Writes the downloaded data to the application's local `SymbolPicker/Images` directory using a unique `UUID` as the filename.

### Architectural Impact

By persisting the downloaded image to disk immediately, `SPImage` ensures that the asset is available offline for all subsequent launches. The metadata is stored within the model, but the image is only loaded into the UI on demand via ``SymbolPicker/SPImageView``.

### Parameters

- **`url`**: The source location of the image.
- **`fileName`**: An optional name for the asset. If `nil`, the last path component of the URL is used.
- **`zoom`**, **`offsetX`**, **`offsetY`**: Initial layout transformations.

### Error Handling

This initializer throws a `URLError` if:
- The network request fails.
- The server returns a bad status code.
- The data is corrupted or not a valid image format.
