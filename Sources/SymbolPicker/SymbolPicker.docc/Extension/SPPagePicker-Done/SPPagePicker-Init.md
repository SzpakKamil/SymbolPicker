# ``SymbolPicker/SPPagePicker/init()``

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

Initializes a new page picker instance.

## Overview

The `init()` initializer creates an `SPPagePicker` that is fully reactive to the `SymbolPicker` environmental state.

### Dependency Context

When initialized, the picker resolves its behavior from the following environment properties:
1. **Selection Binding**: Binds to the shared `spPageType` environment property.
2. **Allowed Types**: Accesses `spAllowedPageTypes` to determine which segments should be presented.
3. **Style Context**: Utilizes the current `SymbolPickerStyle` for platform-specific layout rules.

### Use in Custom Layouts

`SPPagePicker` is designed to be highly modular. While primarily intended for use within the standard `SymbolPicker` body, it can be integrated into custom picker layouts wherever navigation between asset categories is required.
