# ``SymbolPicker/SPSpacing/Component/optionList``

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

The main list or grid of symbols and emojis.

## Overview

Targeting `.optionList` lets you change the layout of the main asset grid in `SymbolPicker`.

### Visual Impact

Modifying this component changes how users browse assets. You can set the size of symbol cells, which determines how many items fit in a row. Adjusting the padding around cells changes the density of the grid. This makes the picker feel either open and airy or dense and content-rich.

### Platform Adaptation

The asset grid needs different spacing on different devices. macOS works best with compact layouts, while iOS requires larger touch targets. Use `SPSpacing` to define these platform differences. This ensures the scrolling experience feels native whether the user is on a phone or a computer.
