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

A unique identifier for the image asset, essential for persistence and list stability.

## Overview

The `id` property is a `UUID` generated during the instantiation of a new `SPImage`. It serves as the canonical identity for the asset, ensuring it remains unique within the `SymbolPicker` ecosystem.

### Architectural Purpose

The identifier is the primary mechanism for decoupling a light model instance from its heavy binary data:
- **Disk Identification**: The binary image data is stored on disk using this ID as the filename (e.g., `\(id.uuidString).data`). This ensures that even if two images have the same ``SymbolPicker/SPImage/fileName``, they will never collide on the file system.
- **SwiftUI List Stability**: The `id` provides a stable key for the `Identifiable` protocol, allowing SwiftUI's diffing algorithm to correctly track and animate image cells within a grid or list during sorting or filtering operations.

### Life Cycle

The `id` is immutable once an asset is created. When an `SPImage` is encoded or decoded via its `Codable` implementation, this identifier is used to resolve the correct source or destination path on the local file system.
