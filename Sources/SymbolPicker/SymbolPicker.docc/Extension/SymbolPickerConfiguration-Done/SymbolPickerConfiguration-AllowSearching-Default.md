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


A boolean flag that enables or disables the search functionality in the picker.

## Overview

The `allowSearching` property determines whether the search bar is displayed to the user. The implementation of search varies depending on the platform version and the ``SymbolPicker/SPDisplayStyle``.

### Behavior by Version and Style

#### iOS 26.0 and Newer
- **Compact Style (``SymbolPicker/SPDisplayStyle/compact``)**: If `allowSearching` is set to `false`, the native SwiftUI `.searchable()` modifier is removed from the view hierarchy. This ensures a clean, non-filtered interface.
- **Detail Style (``SymbolPicker/SPDisplayStyle/detail``)**: Setting this to `false` prevents the ``SymbolPicker/SPSearchBar`` component from being added to the layout via the inset view system.

#### Older OS Versions (Below iOS 26.0)
Across all styles on older versions, `allowSearching = false` causes the configuration to omit the ``SymbolPicker/SPSearchBar`` from the `insetViewsConfiguration()`.

### Implementation Detail

The ``SymbolPicker/SymbolPicker`` view uses this property to dynamically adjust its `body`. For instance, in the native navigation stack integration:

```swift
if #available(iOS 26.0, *), style.displayStyle == .compact, style.allowSearching {
    view().searchable(text: $searchText, ...)
}
```

By toggling this flag, you can maintain consistent search behavior across all platforms and versions supported by the package.
