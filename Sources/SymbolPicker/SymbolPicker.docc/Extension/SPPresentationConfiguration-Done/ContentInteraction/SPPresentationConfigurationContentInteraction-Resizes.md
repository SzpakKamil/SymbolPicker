# ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/resizes``

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

Content resizes during a drag gesture.

## Overview

When set to `.resizes`, the presentation's content actively participates in the resizing animation. This means that as the user drags the sheet to a new height, the content's layout is continuously invalidated and recalculated.

### Performance & Layout
- **Responsiveness**: This mode is visually seamless for content that needs to adapt its layout (e.g., reflowing text or resizing grids) to fit the available space dynamically.
- **Cost**: Be aware that continuous layout invalidation can be performance-intensive for complex view hierarchies.

### Use Case
Ideal for dynamic forms or content that must always fill the available vertical space without scrolling.

