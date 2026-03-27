# ``SymbolPicker/SPPresentationConfiguration/DisplayType/popover``

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

You show the picker as a floating panel.

## Overview

The `.popover` style anchors the picker to a specific view. You'll see an arrow pointing to the button or symbol that triggered the presentation. This keeps the picker in context with the element you are modifying.

### Behavior
- **iPadOS**: You get a standard floating panel. Tapping outside usually dismisses it.
- **iOS (iPhone)**: The system may turn the popover into a sheet unless you force the style.
- **macOS**: This is the lightweight default for auxiliary controls.

### Use Case
Use this for pickers that modify a specific on-screen element, like changing an icon in a toolbar.
