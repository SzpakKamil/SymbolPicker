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

Initializes a new search bar instance.

## Overview

The `init()` initializer creates an `SPSearchBar` that is fully reactive to the `SymbolPicker` environmental context.

### Reactive Search Bindings

When initialized, the search bar resolves its functionality from several environmental dependencies:
1. **Search Text**: Binds to the shared `spSearchText` environment property.
2. **Dynamic Context**: Accesses the current `spPageType` to determine the appropriate placeholder (prompt).
3. **Style Rules**: Uses the current `SymbolPickerStyle` to determine if searching should be allowed and what background materials to apply.
4. **Adaptive Spacing**: Integrates with the `dynamicTypeSize` to calculate appropriate padding and sizing.

### Layout Integration

While `SPSearchBar` can be placed anywhere in a view hierarchy, it is most effective when used with the `asInsetView()` helper method to ensure correct positioning within the `SymbolPicker` grid.
