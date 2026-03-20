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

Selecting `.optionList` as the target component allows you to customize the core navigation experience within the `SymbolPicker`.

### Visual Impact

Modifying spacing for this component affects:
- **Grid Layout**: Adjusts the size of the symbol or emoji cells, which directly impacts the number of items shown per row.
- **Scrolling Experience**: Changes to padding around each cell can significantly influence the "density" of the picker, making it feel more open or more content-rich.
- **Section Spacing**: Adjusting the vertical and horizontal padding around the list can help align the main content with other UI elements like the search bar or category picker.

### Platform Adaptation

The `.optionList` is the most sensitive area to platform changes. For example, macOS requires more compact spacing than iOS. By using `SPSpacing`, you can specify these differences to ensure a platform-native feel.
