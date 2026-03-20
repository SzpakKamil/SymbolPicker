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

Presents the picker as a full-screen cover.

## Overview

When set to `.fullScreenCover`, the `SymbolPicker` completely obscures the underlying content. This presentation style removes the context of the parent view entirely, focusing the user solely on the symbol selection task.

### Behavior
- **Dismissal**: Unlike sheets or popovers, a full-screen cover typically does not support swipe-to-dismiss. You must provide an explicit dismissal mechanism (e.g., a "Done" or "Cancel" button).
- **Transitions**: Uses a distinct transition animation (usually sliding up from the bottom).

### Use Case
Best for highly immersive workflows or complex, multi-step symbol configuration tasks where distractions should be minimized.
