# ``SymbolPicker/SPInsetedView/Placement/safeAreaBottom``

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

Placement at the bottom safe area of the picker container.

## Overview

When set to `.safeAreaBottom`, the inset view is pinned to the bottom of the picker's main container. This ensures that the view remains anchored at the bottom of the interface, even as the user scrolls through symbols or emojis.

### Use Case
Ideal for "Selection Previews" or "Action Buttons" that need to be always accessible at the bottom of the picker.
