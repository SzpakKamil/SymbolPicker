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

Content scrolls during a drag gesture if possible.

## Overview

When set to `.scrolls`, the system prioritizes scrolling the content within the sheet over resizing the sheet itself. If the content view contains a scroll view (like a `List` or `ScrollView`), vertical drag gestures will typically scroll the content unless:
1.  The scroll view is already at the top edge (allowing pull-to-dismiss or drag-to-resize downward).
2.  The scroll view is at the bottom edge (allowing drag-to-resize upward).

### Use Case
Use this mode when the primary content of your sheet is a long, scrollable list (e.g., a symbol grid) and you want to ensure that users can navigate the content easily without accidentally triggering a sheet resize.
