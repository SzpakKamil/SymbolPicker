# ``SymbolPicker/SPSymbol/Variant/id``

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

A string representation of the variant.

## Overview

The `id` property returns a capitalized string for each enum case. This is useful for building user interfaces that display the available styles.

### UI Integration

The property returns a simple string, so you can use it in SwiftUI controls:
- **Pickers**: Set labels for a dropdown or segmented control.
- **Settings**: Show the active style in a configuration menu.
- **Accessibility**: Provide descriptive labels for VoiceOver.

### Mapping

- Returns `"Filled"` for the `.filled` case.
- Returns `"Outlined"` for the `.outlined` case.
