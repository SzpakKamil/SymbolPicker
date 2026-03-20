# ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/disabled``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.4")
    @Available(iPadOS, introduced: "16.4")
    @Available(macOS, introduced: "13.3")
    @Available(tvOS, introduced: "16.4")
    @Available(watchOS, introduced: "9.4")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.7")
    @Available(Xcode, introduced: "14.3")
    @DocumentationExtension(mergeBehavior: override)
}

Prevents interaction with views behind the presentation.

## Overview

When set to `.disabled`, touches or clicks on the background view are blocked, preventing any interaction with the underlying content. This is the classic "modal" behavior, often accompanied by a dimming view or overlay to indicate that the user's focus should remain on the presentation.

### Behavior
- **Focus**: Effectively directs user attention solely to the symbol picker.
- **Dismissal**: Tapping on the dimmed background usually dismisses the presentation (unless `isModal` or other restrictions are applied).

### Use Case
Use this mode when the picker's selection is a primary, blocking task that must be completed or cancelled before resuming interaction with the rest of the application.
