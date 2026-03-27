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

The file path where the app saves the image data.

## Overview

The `localURL` property points to the exact location of the image file on your device. It separates the light metadata from the heavy pixel data.

### Storage Path

The app builds this URL using the asset's ``SymbolPicker/SPImage/id``:
`~/Library/Application Support/SymbolPicker/Images/\(id.uuidString).data`

### Usage

The `localURL` serves three main purposes:
1. **Saving**: The app writes raw binary data to this path during setup.
2. **Checking**: The ``SymbolPicker/SPImage/isAvailable()`` method checks if a file exists at this URL.
3. **Loading**: The ``SymbolPicker/SPImageView`` uses this path to fetch pixels for the screen. By loading only when the view appears, the picker uses very little memory.

### Safety

The property resolves to the correct `Application Support` folder within the app's sandbox. This ensures your images remain safe and accessible across different OS versions and devices.
