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

Target locations for inset views.

## Overview

The `Placement` enum sets where an ``SymbolPicker/SPInsetedView`` appears in the picker. Placements include fixed safe areas, scrollable content slots, and platform-specific toolbars.

## Topics

### Safe Area Placements
- ``SymbolPicker/SPInsetedView/Placement/safeAreaTop``
- ``SymbolPicker/SPInsetedView/Placement/safeAreaBottom``

### Scroll Content Placements
- ``SymbolPicker/SPInsetedView/Placement/scrollContentTop``
- ``SymbolPicker/SPInsetedView/Placement/scrollContentBottom``
- ``SymbolPicker/SPInsetedView/Placement/scrollSectionTop``
- ``SymbolPicker/SPInsetedView/Placement/scrollSectionBottom``

### Toolbar Placements
- ``SymbolPicker/SPInsetedView/Placement/toolbarTopLeading``
- ``SymbolPicker/SPInsetedView/Placement/toolbarTopTralling``
- ``SymbolPicker/SPInsetedView/Placement/toolbarBottomLeading``
- ``SymbolPicker/SPInsetedView/Placement/toolbarBottom``
- ``SymbolPicker/SPInsetedView/Placement/toolbarBottomTralling``

### Identification and Initialization
- ``SymbolPicker/SPInsetedView/Placement/id``
- ``SymbolPicker/SPInsetedView/Placement/init(rawValue:)``
