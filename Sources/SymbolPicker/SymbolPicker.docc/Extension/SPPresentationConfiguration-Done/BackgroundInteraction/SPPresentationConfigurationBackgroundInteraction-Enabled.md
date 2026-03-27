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

Enable interaction with views behind the presentation.

## Overview

Users tap buttons, scroll lists, and select text in the background while the picker remains on screen. This mode turns the picker into a non-modal tool. You provide a continuous workflow where the user manages both the main content and their symbol selections at the same time.

### Continuous Workflow
Use this setting for floating palettes and utility panels. 

If you build a text editor, you can keep the symbol picker open at the bottom of the screen. The user continues typing or formatting their document above the picker. When they need a symbol, they tap one and immediately see it appear in their text without losing focus on the editor.

### Gesture Management
Watch for gesture conflicts when both the background and the picker scroll in the same direction. If the user drags a list in the background, ensure the system doesn't accidentally move the picker instead. Clear visual boundaries help users understand which area they are currently controlling.
