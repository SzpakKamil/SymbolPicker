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

You create a navigation control to switch between asset types.

## Overview

The `init()` initializer creates an `SPPagePicker` that listens to your app's environment. It connects directly to the settings you define for the broader `SymbolPicker`.

### Dependency Context

The picker resolves its behavior from these environmental properties:
1. **Selection Binding**: It binds to the shared `spPageType` to track which category you are viewing.
2. **Allowed Types**: It reads `spAllowedPageTypes` to decide which segments to show, such as Symbols or Emojis.
3. **Style Context**: It uses the current `SymbolPickerStyle` to apply the right layout rules for your device.

### Use in Custom Layouts

`SPPagePicker` is modular. You can use it inside the standard picker or integrate it into your own custom layouts where you need to switch between asset categories.
