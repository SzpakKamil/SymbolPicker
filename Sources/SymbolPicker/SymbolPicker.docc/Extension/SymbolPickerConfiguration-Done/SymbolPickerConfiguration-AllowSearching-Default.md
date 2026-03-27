# ``SymbolPicker/SymbolPickerConfiguration/allowSearching-92ykr``

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
}

Enables or disables search in the picker.

## Overview

The `allowSearching` property sets whether the user sees a search bar. Implementation details change based on the OS version and the ``SymbolPicker/SPDisplayStyle``.

### Behavior

#### iOS 26.0+
- **Compact Style**: Setting this to `false` removes the native `.searchable()` modifier. This keeps the interface clean.
- **Detail Style**: Setting this to `false` prevents the system from adding the ``SymbolPicker/SPSearchBar`` to the layout.

#### Older OS Versions
Across all styles on older systems, `allowSearching = false` causes the configuration to omit the search bar from the inset views.

### Details

The picker view uses this property to adjust its body. For example, it checks this flag before applying the searchable modifier in a navigation stack. Toggling this flag maintains consistent search rules across all platforms.
