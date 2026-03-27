# ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/scrolls``

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

You prioritize scrolling through symbols over resizing the sheet.

## Overview

When you set this to `.scrolls`, the system focuses on moving your content. Dragging inside the sheet will move the symbol grid instead of changing the sheet's height. 

Vertical gestures will scroll the symbols unless you reach the very top or bottom of the list. At those boundaries, the system permits a pull-to-dismiss or a resize. This prevents users from accidentally collapsing the picker while they search for a specific icon.

### Use Case
Apply this mode when your sheet features a long list or grid. It ensures users navigate the library without the container moving unexpectedly.
