# ``SymbolPicker/SPPresentationConfiguration/DisplayType/fullScreenCover``

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

You hide the entire screen behind the picker.

## Overview

The `.fullScreenCover` style removes all context. The `SymbolPicker` covers every pixel of the underlying app, forcing the user to focus only on their selection.

### Behavior
- **Dismissal**: Users cannot swipe this away. You must provide a "Done" or "Cancel" button to close the picker.
- **Transitions**: The view typically slides up from the bottom, replacing the current screen entirely.

### Use Case
Choose this for immersive workflows. It works best when you need the user to configure a symbol through several steps without any background distractions.
