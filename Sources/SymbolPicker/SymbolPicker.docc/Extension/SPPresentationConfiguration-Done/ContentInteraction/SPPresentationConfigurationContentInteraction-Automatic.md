# ``SymbolPicker/SPPresentationConfiguration/ContentInteraction/automatic``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.4")
    @Available(iPadOS, introduced: "16.4")
    @Available(macOS, introduced: "13.3")
    @Available(tvOS, introduced: "16.4")
    @Available(watchOS, introduced: "9.4")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.7")
    @Available(Xcode, introduced: "14.3")
    @DocumentationExtension(mergeBehavior: override)
}

You let the system manage how the content reacts to gestures.

## Overview

The `.automatic` setting lets the platform choose between resizing and scrolling. It looks at your content hierarchy to preserve expected behaviors like pulling down to dismiss. 

You should use this mode as your starting point. It handles the native feel for standard lists, allowing users to scroll through symbols and expand the sheet naturally. Only change this if you notice gesture conflicts where the sheet resizes when you intended to scroll.

### Use Case
Start with this mode for standard symbol grids. It maintains the platform's default gesture logic.
