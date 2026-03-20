# ``SymbolPicker/SPPresentationConfiguration/PresentationDents/fraction(_:)``

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

A fractional presentation detent.

## Overview

When set to `.fraction(_:)`, the sheet's height is defined as a proportion of the available vertical space. This ensures that the picker maintains its relative size across different devices and orientations.

### Parameters
- `fraction`: A value between 0.0 and 1.0 (e.g., 0.33 for a third of the screen height).

### Use Case
Useful for creating flexible layouts that should scale proportionally with the screen size (e.g., ensuring the picker always takes up roughly one-third of the screen on both a small iPhone and a large iPad).
