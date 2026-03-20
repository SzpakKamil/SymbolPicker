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

A custom height presentation detent.

## Overview

When set to `.height(_:)`, the sheet snaps to a specific vertical height in points. This allows you to precisely control how much screen real estate the picker consumes, regardless of the screen's size or resolution.

### Parameters
- `height`: The fixed height of the sheet.

### Use Case
Best for interfaces where the picker has a known, fixed-height content (like a single row of symbols or a compact toolset) that doesn't benefit from resizing.
