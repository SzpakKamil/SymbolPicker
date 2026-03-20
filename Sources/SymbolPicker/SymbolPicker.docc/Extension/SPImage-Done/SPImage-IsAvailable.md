# ``SymbolPicker/SPImage/isAvailable()``

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

Performs a runtime check to verify if the image data is locally available and renderable.

## Overview

The `isAvailable()` method is a critical safety check for image assets. Unlike symbols or emojis—which are system-resident and can be verified by name or Unicode version—images rely on the integrity of the host application's local file system.

### Verification Logic

This method executes a two-stage validation pipeline:
1. **File System Verification**: Confirms that a physical file exists at the expected ``SymbolPicker/SPImage/localURL``. 
2. **Structural Validation**: Uses `CGImageSourceCreateWithURL` to inspect the contents of the file. A result of `true` is only returned if:
   - The file contains a complete image stream (`CGImageSourceGetStatus` is `.statusComplete`).
   - The file contains at least one image frame.

### Architectural Importance

The `SPDataManager` uses this method to filter the image library during the asset loading phase. By excluding "zombie" assets—images where the metadata (like the ID and filename) is known but the binary data has been manually deleted or moved—the `SymbolPicker` avoids displaying broken image placeholders or causing SwiftUI rendering errors.

### Performance Consideration

Because this method reads from disk, it is highly optimized. It only performs the structural check if the file system check passes, and it avoids fully decoding the image into memory, keeping the overhead low even when scanning a large library of assets.
