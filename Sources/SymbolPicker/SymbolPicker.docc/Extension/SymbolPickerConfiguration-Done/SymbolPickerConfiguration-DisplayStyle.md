# ``SymbolPicker/SymbolPickerConfiguration/displayStyle-1zlq8``

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


An ``SymbolPicker/SPDisplayStyle`` enum indicating the overall density and layout strategy of the picker.

## Overview

The `displayStyle` property determines the initial visual density of the picker. It can be set to either ``SymbolPicker/SPDisplayStyle/compact``, ``SymbolPicker/SPDisplayStyle/detail`` or ``SymbolPicker/SPDisplayStyle/plain``.

### Display Styles

- **``SymbolPicker/SPDisplayStyle/compact``**: A dense grid focused on fitting more items on screen. Typically used for quick selections.
- **``SymbolPicker/SPDisplayStyle/detail``**: A more informative layout, often including larger previews and labels. 
- **``SymbolPicker/SPDisplayStyle/plain``**: A simple layout.

This property is also passed to all configuration methods, allowing them to return different setups based on the current style.
