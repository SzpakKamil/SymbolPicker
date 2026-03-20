# ``SymbolPicker/SPImage/createdAt``

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

The timestamp indicating when the image asset was created or first processed.

## Overview

The `createdAt` property captures the `Date` when the `SPImage` instance was initialized. This timestamp provides chronological context for the asset, enabling developers and users to track the history of the asset's presence in the `SymbolPicker` library.

### Architectural Usage

- **Chronological Sorting**: The `SPDataManager` can utilize this property to sort image collections, allowing the `SymbolPicker` to present the user's most recent imports at the top of the grid.
- **Asset Auditing**: For applications that sync images across multiple devices, the `createdAt` timestamp is essential for conflict resolution and history tracking.

### Immutable Lifecycle

The `createdAt` property is set at the moment of initialization and remains immutable for the life of the asset instance. When an `SPImage` is encoded or decoded, this timestamp is preserved, ensuring the asset's history is maintained across app launches and storage media.
