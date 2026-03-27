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

Verify that image data exists and can render.

## Overview

Call `isAvailable()` to check an asset's integrity. Symbols and emojis live in the system, but images live in your app's local storage. This method ensures the file is where you expect it.

### The Two-Step Check

The check follows a clear logic. First, it looks for a physical file at the `localURL`. Second, it inspects the file using `CGImageSourceCreateWithURL`. You get `true` only if the image stream is complete and contains at least one frame.

### Avoid Zombie Assets

The `SPDataManager` filters your library using this method. It removes "zombie" assets that have metadata but no actual file. This prevents broken placeholders and rendering errors in SwiftUI.

### Speed and Memory

This check is fast. It only inspects the file structure if the file exists. Since it skips full decoding, you can scan large libraries without slowing down the app or eating up memory.
