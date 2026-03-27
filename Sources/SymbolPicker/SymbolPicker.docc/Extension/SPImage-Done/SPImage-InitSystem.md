# ``SymbolPicker/SPImage/init(systemName:)``

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

Creates a persistent image asset from an Apple SF Symbol.

## Overview

Use this failable initializer to convert an SF Symbol into a static, pixel-based `SPImage`. This helps when you need to treat symbols as standard images or apply precise layout changes like zoom and offset.

### Rendering and Storage

1. **Native Rendering**: 
   - On **iOS, iPadOS, tvOS, and visionOS**: The app uses `UIImage(systemName:)` with a 100-point regular weight configuration.
   - On **macOS**: The app uses `NSImage(systemSymbolName:)` and extracts the `cgImage` for a consistent coordinate system.
2. **PNG Encoding**: The system flattens the vector symbol into a high-resolution PNG data stream.
3. **Sizing**: The initializer captures the symbol's intrinsic size and stores it as the image's width and height.
4. **Persistence**: The app writes the PNG data to your `Application Support` directory.

### Advantages of SPImage Symbols

Converting symbols to `SPImage` offers several benefits:
- **Unified Layout**: You apply the same zoom and pan mechanics to symbols and photos.
- **Simplified Management**: You store symbols and custom images in the same database or folder.
- **Easy Export**: You share or export symbols as standard PNG files.

### Parameters

- **`systemName`**: The SF Symbol identifier, such as `"star.bubble.fill"`.

### Failure Conditions

The initializer returns `nil` if:
- The current OS version does not support the `systemName`.
- The rendering context fails to create pixel data.
- PNG encoding fails.
