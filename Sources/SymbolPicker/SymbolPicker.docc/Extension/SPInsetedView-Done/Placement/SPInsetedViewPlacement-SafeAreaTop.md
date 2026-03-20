# ``SymbolPicker/SPInsetedView/Placement/safeAreaTop``

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

Placement at the top safe area of the picker container.

## Overview

When set to `.safeAreaTop`, the inset view is pinned to the top of the picker's main container, outside of any scrollable content. This is an ideal location for headers, branding, or global navigation controls that should remain visible at all times.

### Use Case
Use this placement for a title bar or a custom search field that needs to stay anchored at the top of the picker interface.
