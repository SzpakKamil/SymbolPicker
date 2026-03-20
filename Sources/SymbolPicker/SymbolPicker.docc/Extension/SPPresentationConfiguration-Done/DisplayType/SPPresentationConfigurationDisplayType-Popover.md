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

Presents the picker as a popover.

## Overview

When set to `.popover`, the `SymbolPicker` is presented as a floating panel anchored to a specific view. This style typically includes an arrow pointing to the source of the presentation (e.g., a button or a selected symbol).

### Behavior
- **iPadOS**: Standard popover behavior; taps outside usually dismiss the popover.
- **iOS (iPhone)**: Popovers may automatically adapt to sheets in compact environments unless forced.
- **macOS**: The standard, lightweight presentation style for auxiliary controls.

### Use Case
Best for context-specific pickers where the user is modifying a particular element on the screen, rather than performing a global action.
