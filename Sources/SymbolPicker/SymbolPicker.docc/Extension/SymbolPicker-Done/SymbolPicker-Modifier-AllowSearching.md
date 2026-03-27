# ``SymbolPicker/SymbolPicker/spAllowSearching(_:)``

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

Enables or disables search in the picker.

## Overview

When enabled, a search bar filters symbols by name. The bar integrates into the picker's toolbar or navigation system based on the platform and display style.

### Search Behavior

- **Live Filtering**: The asset grid updates as you type.
- **Localized Search**: The system checks localized names for SF Symbols and Emojis.
- **Platform Integration**: On iOS 26+, the search bar uses the `toolbarPrincipal` placement for better visibility.

### Example

Enable searching for a symbol picker:

```swift
SymbolPicker(systemImage: $symbolName)
    .spAllowSearching(true)
```

### Parameters

- **condition**: Set to `true` to allow searching.
