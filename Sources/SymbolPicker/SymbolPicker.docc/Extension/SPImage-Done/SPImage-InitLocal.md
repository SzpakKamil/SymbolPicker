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

Initializes a new image asset from raw data.

## Overview

The `init(fileName:rawData:...)` initializer is the primary method for creating `SPImage` instances from locally provided binary data. It is most commonly used when integrating with a photo picker (e.g., `PHPickerViewController`) or when importing images from the file system.

### Automated Metadata Resolution

A key feature of this initializer is its ability to infer missing information:
- **Dimension Resolution**: If the provided `width` or `height` is `0`, the initializer uses `CGImageSourceCreateWithData` to inspect the `rawData` and extract the intrinsic pixel dimensions. This ensures the `SymbolPicker` grid can accurately maintain the asset's aspect ratio.
- **Immediate Persistence**: The `rawData` is immediately written to the application's local `SymbolPicker/Images` directory. This allows the model instance itself to remain lightweight while the heavy asset data is managed by the file system.

### Best Practices

When using this initializer to import images from a photo library:
1. Provide a meaningful `fileName` to ensure high-quality search results and accessibility labels.
2. If the user has already performed cropping in the source picker, you can initialize the `zoom`, `offsetX`, and `offsetY` values to reflect that state.

### Parameters

- **`fileName`**: The name of the asset.
- **`rawData`**: The binary image data (e.g., JPEG, PNG, HEIC).
- **`zoom`, `offsetX`, `offsetY`**: Initial layout transformations.
- **`width`, `height`**: The intrinsic pixel dimensions. If left at `0`, the initializer will calculate these from the `rawData`.
