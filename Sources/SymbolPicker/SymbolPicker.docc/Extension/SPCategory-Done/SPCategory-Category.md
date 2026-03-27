# ``SymbolPicker/SPCategory/category``

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

The localized name of the category.

## Overview

The `category` property stores the name you see in the picker headers.

### Localization

``SymbolPicker/SPDataManager`` converts raw category IDs into localized text when it fetches assets. It uses the strings from your app's localization files. This ensures users see category names in their own language.

### Sorting

SymbolPicker sorts categories alphabetically by this name. This makes finding items easier and more predictable.
