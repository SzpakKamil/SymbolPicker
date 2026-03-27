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

Fetches image data from a remote URL and initializes the instance.

## Overview

Use this initializer to pull external images into the `SymbolPicker` library. It manages the download, processing, and storage of remote data while keeping memory usage low.

### Loading Process

1. **Download**: The app uses `URLSession.shared.data(from:)` to fetch binary data from the `url`.
2. **Validation**: The system checks for a successful HTTP status code between 200 and 299.
3. **Sizing**: `SPImage` uses `CGImageSourceCreateWithData` to read the image's width and height. This avoids loading the full image into memory but still gives the layout engine the data it needs.
4. **Storage**: The app saves the data to the local `SymbolPicker/Images` folder. It uses a unique `UUID` for the filename.

### Local Caching

By saving the image to disk immediately, `SPImage` makes the asset available offline. The model stores the metadata, but the UI only loads the actual image when needed through ``SymbolPicker/SPImageView``.

### Parameters

- **`url`**: The location of the remote image.
- **`fileName`**: A name for the asset. If you leave this `nil`, the app uses the last part of the URL.
- **`zoom`**, **`offsetX`**, **`offsetY`**: The starting layout settings.

### Errors

This initializer throws a `URLError` if:
- The network connection fails.
- The server returns an error code.
- The downloaded data is not a valid image.
