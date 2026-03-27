# ``SymbolPicker/SPPagePicker``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

You switch between Symbols, Emojis, and Images with this control.

## Overview

`SPPagePicker` provides the top-level navigation for the `SymbolPicker`. It lets you toggle between library categories, like moving from SF Symbols to the Emoji grid.

### Adaptive Segment Management

The picker follows your `SymbolPickerStyle` and reads the `spAllowedPageTypes` environment property.
- **Auto-Hiding**: If you only allow one asset type, the `SPPagePicker` hides itself to save screen space.
- **Dynamic Content**: If you specify certain page types in your style, the picker only displays those categories.

### Native Platform Experiences

The `SPPagePicker` changes its look to match the device:
- **iOS/visionOS**: You see a standard segmented picker. On modern visionOS versions, it integrates into a floating glass capsule.
- **watchOS**: You get a simple toggle button with an icon and label to save space.
- **macOS/tvOS**: You see a layout with specialized spacing and alignment for mouse or remote focus.

### State Integration

The picker binds to the `spPageType` environment property. When you select a new segment, the entire `SymbolPicker` instantly loads the new asset category.

## Topics

### Initialization

- ``SymbolPicker/SPPagePicker/init()``
