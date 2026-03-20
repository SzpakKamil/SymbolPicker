# ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/enabled``

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

Allows interaction with views behind the presentation.

## Overview

When set to `.enabled`, users can freely interact with the views behind the presentation (e.g., tap buttons, scroll lists, or select text) while the sheet or popover remains visible. This effectively transforms the presentation into a non-modal overlay, allowing for a continuous workflow.

### Considerations
- **Non-Modal Feel**: This mode is ideal for utility panels, floating palettes, or reference sheets where the user needs to work on the underlying content simultaneously.
- **Scrolling Conflicts**: Be mindful of potential gesture conflicts if both the presentation and the background view are scrollable in the same direction.

### Example
A symbol picker used as a floating "inspector" panel for a text editor, allowing the user to insert symbols while keeping the document editable.
