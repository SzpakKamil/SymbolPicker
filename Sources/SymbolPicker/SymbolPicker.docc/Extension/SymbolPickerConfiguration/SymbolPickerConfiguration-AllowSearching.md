# ``SymbolPicker/SymbolPickerConfiguration/allowSearching``

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

A boolean flag that enables or disables the search functionality in the picker.

## Overview

The `allowSearching` property determines whether the search bar is displayed to the user. If disabled, the search bar and related filtering capabilities are removed from the UI.

### Customization

```swift
var allowSearching: Bool = false
```
