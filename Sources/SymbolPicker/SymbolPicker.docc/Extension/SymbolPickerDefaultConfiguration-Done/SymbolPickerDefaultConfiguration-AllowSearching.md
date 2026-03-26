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

A boolean value that indicates whether searching is permitted within the picker.

## Overview

By default, this property is set to `true`, allowing users to use a search bar to filter the displayed visual assets by name.

### Search Behavior

When enabled, the picker integrates with the platform's standard search system. On modern platforms like iOS 26+, it uses enhanced styling and placement within the navigation bar for a more cohesive experience.

### Customization

If your use case only involves a small, predefined set of assets where searching would be redundant, you can disable it.

```swift
var config = SymbolPickerDefaultConfiguration()
config.allowSearching = false // Disable search functionality
```
