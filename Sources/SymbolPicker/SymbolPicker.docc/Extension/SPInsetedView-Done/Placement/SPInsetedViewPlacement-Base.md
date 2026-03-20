# ``SymbolPicker/SPInsetedView/Placement``

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

Defines the target locations for inset views within the symbol picker.

## Overview

The `Placement` enum specifies where an ``SymbolPicker/SPInsetedView`` will be rendered. These placements range from standard safe areas to platform-specific toolbar locations.

## Topics

### Safe Area Placements
Placements relative to the picker's main container boundaries.

- ``SymbolPicker/SPInsetedView/Placement/safeAreaTop``
- ``SymbolPicker/SPInsetedView/Placement/safeAreaBottom``

### Scroll Content Placements
Placements relative to the scrollable area of the picker.

- ``SymbolPicker/SPInsetedView/Placement/scrollContentTop``
- ``SymbolPicker/SPInsetedView/Placement/scrollContentBottom``
- ``SymbolPicker/SPInsetedView/Placement/scrollSectionTop``
- ``SymbolPicker/SPInsetedView/Placement/scrollSectionBottom``

### Toolbar Placements
Placements within platform-native toolbars (where supported).

- ``SymbolPicker/SPInsetedView/Placement/toolbarTopLeading``
- ``SymbolPicker/SPInsetedView/Placement/toolbarTopTralling``
- ``SymbolPicker/SPInsetedView/Placement/toolbarBottomLeading``
- ``SymbolPicker/SPInsetedView/Placement/toolbarBottom``
- ``SymbolPicker/SPInsetedView/Placement/toolbarBottomTralling``

### Identification and Initialization
Properties and methods for working with raw values.

- ``SymbolPicker/SPInsetedView/Placement/id``
- ``SymbolPicker/SPInsetedView/Placement/init(rawValue:)``
