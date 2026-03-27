# ``SymbolPicker/SPImage/id``

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

A unique identifier for the image asset.

## Overview

The `id` property is a `UUID` that the app creates when you instantiate a new `SPImage`. It identifies the asset within the `SymbolPicker` ecosystem.

### Purpose

This identifier connects the model to its binary data:
- **Disk Storage**: The app saves image data on disk using this ID as the filename. This prevents collisions even if two images share the same ``SymbolPicker/SPImage/fileName``.
- **UI Stability**: The `id` provides a stable key for SwiftUI lists. It helps the diffing algorithm track and animate image cells correctly during sorting or filtering.

### Lifecycle

The `id` remains fixed once you create an asset. The `Codable` implementation uses this identifier to find the correct file path on your local system.
