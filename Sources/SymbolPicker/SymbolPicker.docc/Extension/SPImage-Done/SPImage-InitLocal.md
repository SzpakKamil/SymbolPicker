# ``SymbolPicker/SPImage/init(fileName:rawData:zoom:offsetX:offsetY:width:height:)``

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

Initialize an image asset using binary data.

## Overview

Use `init(fileName:rawData:...)` to create `SPImage` instances from local sources like `PHPickerViewController` or the file system. You pass the raw bytes and a name to build the asset.

### Resolve Metadata Automatically

The initializer calculates missing information without extra steps. 

If you set `width` or `height` to `0`, the system extracts the actual size from the bytes using `CGImageSourceCreateWithData`. This keeps the grid layout consistent even if you don't know the dimensions upfront.

### Storage and Performance

The system writes the `rawData` to the `SymbolPicker/Images` directory during initialization. Storing heavy data on disk keeps the model instance light. You can manage thousands of assets in memory because the binary data stays in the file system until you need to render it.

### Parameters

- **`fileName`**: The name you assign to the asset.
- **`rawData`**: The binary image data (JPEG, PNG, or HEIC).
- **`zoom`, `offsetX`, `offsetY`**: The initial layout transformations.
- **`width`, `height`**: The pixel dimensions. Set these to `0` to let the system calculate them from the data.
