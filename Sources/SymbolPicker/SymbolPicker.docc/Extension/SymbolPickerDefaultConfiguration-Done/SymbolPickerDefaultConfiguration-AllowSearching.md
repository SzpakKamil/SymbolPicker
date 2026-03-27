# ``SymbolPicker/SymbolPickerDefaultConfiguration/allowSearching``

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
    @AutomaticArticleSubheading(disabled)
}

Toggles search in the picker.

## Overview

This property defaults to `true`, giving users a search bar to filter assets by name.

### Search Behavior

When active, the picker uses the platform's standard search system. On iOS 26+, it integrates into the navigation bar for a native feel.

### Customization

Disable search if you provide a small, fixed set of assets.

```swift
var config = SymbolPickerDefaultConfiguration()
config.allowSearching = false
```
