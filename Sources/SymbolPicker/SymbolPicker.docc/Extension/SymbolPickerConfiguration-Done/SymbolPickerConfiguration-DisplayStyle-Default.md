# ``SymbolPicker/SymbolPickerConfiguration/displayStyle-13hvb``

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
}

The layout strategy for the picker.

## Overview

The `displayStyle` property sets the initial visual density of the picker using the ``SymbolPicker/SPDisplayStyle`` enum.

### Available Styles

- **`.compact`**: A dense grid that fits many items on screen. Use this for quick selections.
- **`.detail`**: A structured layout with larger previews and labels. 
- **`.plain`**: A simple, unstyled layout.

Configuration methods receive this property to adjust their setups based on the active style.
