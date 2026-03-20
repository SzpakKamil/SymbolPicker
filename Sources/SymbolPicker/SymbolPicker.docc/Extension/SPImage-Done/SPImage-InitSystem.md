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

This failable initializer allows you to convert any system SF Symbol into a static, pixel-based `SPImage` asset. This is particularly useful in workflows where symbols must be treated as standard image files or when they require the precise layout transformations (zoom and offset) provided by the `SPImage` model.

### Internal Logic and Rendering

1. **Platform-Native Rendering**: 
   - On **iOS/iPadOS/tvOS/visionOS**: It uses `UIImage(systemName:)` with a specific `SymbolConfiguration` (point size 100, regular weight) and renders it with a standard black tint.
   - On **macOS**: It uses `NSImage(systemSymbolName:)` and extracts the `cgImage` to ensure a consistent coordinate system.
2. **PNG Encoding**: The resulting vector symbol is flattened into a high-resolution PNG data stream.
3. **Automatic Sizing**: The intrinsic size of the symbol is captured and stored as the image's width and height.
4. **Local Persistence**: The PNG data is written to the user's `Application Support` directory.

### Why use SPImage for Symbols?

While SF Symbols are typically used as vectors, converting them to an `SPImage` provides:
- **Consistent Layout**: Applies the same zoom and pan mechanics to symbols as to photographs.
- **Side-by-Side Unified Management**: Allows symbols to be managed in the same database or file system hierarchy as custom user images.
- **Exportability**: Easily share or export a symbol as a standard pixel-based PNG file.

### Parameters

- **`systemName`**: The identifier for the SF Symbol (e.g., `"star.bubble.fill"`).

### Failure Cases

The initializer returns `nil` if:
- The `systemName` is not supported on the current operating system version.
- The image rendering context fails to generate valid pixel data.
- PNG encoding fails.
