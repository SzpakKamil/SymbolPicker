# ``SymbolPicker/SPDataAsset/category``

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

You group your assets into high-level categories.

## Overview

The `category` property provides high-level grouping for your icons. ``SymbolPicker/SPOptionList`` reads this value to organize assets into logical sections like "Nature" or "People."

### UI Organization

``SymbolPicker/SPDataManager`` uses this property to build ``SymbolPicker/SPCategory`` objects. These objects:
- Build the section headers you see in the UI.
- Structure the navigation inside the ``SymbolPicker/SPOptionList``.
- Allow users to filter through related icons quickly.

### Localization

The picker reads localized categories from JSON resource files. This ensures your organization matches the user's language settings.

### Implementation

Each asset type defines its own category logic. ``SymbolPicker/SPSymbol`` uses SF Symbol metadata, while ``SymbolPicker/SPEmoji`` follows standard Unicode classifications.
