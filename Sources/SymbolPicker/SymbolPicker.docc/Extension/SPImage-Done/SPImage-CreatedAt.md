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

The timestamp of the asset's creation.

## Overview

The `createdAt` property records the `Date` you initialize an `SPImage`. You use this timestamp to track when an asset entered your library.

### Sort and Sync

The `SPDataManager` uses these timestamps to organize your collection. You can sort by `createdAt` to put recent imports at the top of the grid, helping you find new items quickly.

Syncing across devices requires this date. It helps you resolve conflicts by comparing when the asset first appeared on each device.

### Immutability

The system sets this property once and preserves it through encoding and decoding. Your asset's history remains intact across app launches and storage media. This ensures that a photo you imported today stays marked as today's photo even after you restart the application.
