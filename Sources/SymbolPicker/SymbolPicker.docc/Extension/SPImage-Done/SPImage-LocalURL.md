# ``SymbolPicker/SPImage/localURL``

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

The local file system path where the image's binary data is persisted.

## Overview

The `localURL` property resolves the exact location of the asset's binary data on the device's storage. It is the primary reference used by the `SymbolPicker` to decouple lightweight model metadata from heavyweight pixel data.

### Architectural Logic

The URL is constructed dynamically using the asset's ``SymbolPicker/SPImage/id``:
`~/Library/Application Support/SymbolPicker/Images/\(id.uuidString).data`

### Role in the Lifecycle

The `localURL` is the focal point for several key operations:
1. **Persistence**: During initialization, raw binary data is written to this URL.
2. **Availability Check**: The ``SymbolPicker/SPImage/isAvailable()`` method verifies the existence and integrity of the file at this path.
3. **Lazy Loading**: The ``SymbolPicker/SPImageView`` uses this URL as the source for its rendering engine. By loading from this URL only when the view is visible, the picker maintains a low memory footprint even with large image libraries.

### Portability and Sandbox Safety

The property automatically resolves to the correct `Application Support` directory for the current user and application sandbox, ensuring that image assets are managed correctly across different devices and OS versions.
