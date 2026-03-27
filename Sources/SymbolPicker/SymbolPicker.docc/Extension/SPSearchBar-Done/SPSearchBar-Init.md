# ``SymbolPicker/SPSearchBar/init()``

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

Creates a search bar.

## Overview

The `init()` initializer builds an `SPSearchBar` that responds to the picker's environment.

### Dependencies

The search bar uses these values:
1. **Search Text**: Binds to the `spSearchText` property.
2. **Context**: Checks `spPageType` to set the placeholder text.
3. **Style**: Uses `SymbolPickerStyle` to set background materials and search rules.
4. **Spacing**: Adjusts padding based on the user's `dynamicTypeSize`.

### Layout

Place `SPSearchBar` anywhere in your view. Use the `asInsetView()` method to position it correctly within the picker grid.
