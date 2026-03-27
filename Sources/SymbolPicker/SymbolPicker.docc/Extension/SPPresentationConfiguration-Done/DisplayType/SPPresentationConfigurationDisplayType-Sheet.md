# ``SymbolPicker/SPPresentationConfiguration/DisplayType/sheet``

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

You slide the picker up as a modal sheet.

## Overview

When you set the style to `.sheet`, the `SymbolPicker` slides from the bottom on iPhone and iPad. On Mac, it appears as a centered modal attached to your window.

### Characteristics
- **iOS/iPadOS**: You get standard pull-to-dismiss gestures. You can also set multiple heights if you configure ``SymbolPicker/SPPresentationConfiguration/presentationDents``.
- **macOS**: The sheet locks the parent window. You must pick a symbol or cancel to return to the main app.

### Use Case
Use sheets for primary tasks. They give users plenty of room to browse symbols while keeping the original context visible in the background.
