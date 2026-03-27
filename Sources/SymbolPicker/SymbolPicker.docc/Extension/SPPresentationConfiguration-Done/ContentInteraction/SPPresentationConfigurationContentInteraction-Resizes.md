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

You make the sheet resize immediately as you drag it.

## Overview

The `.resizes` setting forces the presentation to update its height during any drag gesture. As you move your finger, the picker recalculates its layout to fill the changing space.

This mode creates a fluid transition between different sheet sizes. It works well when you want the symbol grid to expand and show more rows as the user pulls the sheet up. 

### Performance & Layout
- **Responsiveness**: The picker adapts its layout instantly. It reflows the grid or text to match the new dimensions.
- **Cost**: Complex view hierarchies might lag because the system constantly redraws the content.

### Use Case
Choose this for forms or grids that must always fill the available vertical space.
