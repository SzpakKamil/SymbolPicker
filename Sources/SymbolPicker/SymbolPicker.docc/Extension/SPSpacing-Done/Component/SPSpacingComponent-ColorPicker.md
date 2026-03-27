# ``SymbolPicker/SPSpacing/Component/colorPicker``

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

The color picker component in SymbolPicker.

## Overview

Targeting `.colorPicker` lets you change the size and padding of the color selection area.

### Visual Impact

Changing these values affects the look of the color tools. You can adjust the size of individual color circles and the space around the entire grid. This customization helps separate the color picker from symbols and emojis.

### Platform Behavior

Color pickers appear as rows on iPhone and grids on Apple Watch. Adjusting spacing ensures the selection area stays balanced on every screen. While the library scales cells based on `DynamicTypeSize` by default, your custom values override this for specific designs. This control is vital when you want to show large color sets in a compact space.
