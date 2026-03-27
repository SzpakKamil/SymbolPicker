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

You set the sheet height as a percentage of the screen.

## Overview

The `.fraction(_:)` setting defines the sheet's height as a proportion of the vertical space. This ensures your picker maintains its relative size across different devices and orientations.

### Parameters
- `fraction`: You pass a value between 0.0 and 1.0. For example, 0.33 takes up one-third of the screen.

### Use Case
Use this for flexible layouts. It ensures your picker always covers a specific portion of the view, whether the user is on a small iPhone or a large iPad.
