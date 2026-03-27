# ``SymbolPicker/SPPresentationConfiguration/PresentationDents/height(_:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(iPadOS, introduced: "16.0")
    @Available(macOS, introduced: "13.0")
    @Available(tvOS, introduced: "16.0")
    @Available(watchOS, introduced: "9.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.7")
    @Available(Xcode, introduced: "14.0")
    @DocumentationExtension(mergeBehavior: override)
}

You set the sheet to a fixed pixel height.

## Overview

The `.height(_:)` setting snaps the sheet to a specific vertical point. This gives you precise control over the picker's size, regardless of the device's screen resolution.

### Parameters
- `height`: You pass the fixed height in points.

### Use Case
Use this when you have a known, fixed-size UI. If your picker only contains a small number of symbols, locking the height prevents the user from dragging it into an unnecessarily large or empty state.
