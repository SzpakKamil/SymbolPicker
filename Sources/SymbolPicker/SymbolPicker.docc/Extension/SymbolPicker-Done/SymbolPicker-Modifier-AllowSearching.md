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

Enables or disables the search functionality within the picker.

## Overview

When enabled, a search bar is provided to filter symbols by name. This search bar is integrated into the picker's toolbar or navigation system depending on the current platform and display style.

### Search Behavior

- **Dynamic Filtering**: The grid of assets updates in real-time as the user types.
- **Localized Search**: Searching is performed against the localized names of SF Symbols and Emojis.
- **Platform Integration**: On iOS 26+, the search bar uses the modern `toolbarPrincipal` placement for better visibility and a cleaner look.

### Example

You can conditionally enable searching based on the user's current settings or the picker's context.

```swift
SymbolPicker(systemImage: $symbolName)
    .spAllowSearching(true)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `condition` | `Bool` | A boolean value that indicates whether searching is allowed. |
