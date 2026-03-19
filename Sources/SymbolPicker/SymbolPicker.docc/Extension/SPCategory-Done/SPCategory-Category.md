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

The localized name of the category, used as a header in the user interface.

## Overview

The `category` property holds the human-readable, localized name for the group of assets. This string is what users see when browsing the picker's categories.

### Localization

The value of this property is determined during the fetching process. The ``SymbolPicker/SPDataManager`` maps raw category IDs from asset data to their corresponding localized strings using the app's localization resources.

### Sorting

By default, categories are sorted alphabetically based on this property to ensure a predictable and easy-to-navigate user interface.
