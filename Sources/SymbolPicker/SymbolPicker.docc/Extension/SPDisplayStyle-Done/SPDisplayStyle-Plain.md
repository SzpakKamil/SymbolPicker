# ``SymbolPicker/SPDisplayStyle/plain``

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

A minimal style for the `SymbolPicker`.

## Overview

The `plain` style removes most custom decorations to provide a clean interface. It works well when you want to embed the picker in existing UI structures. You can drop this style into a SwiftUI `List` or `Grid` without clashing with your app's design.

### Ideal Uses

- **Custom Lists**: You integrate the picker into a standard SwiftUI list.
- **Embedded Components**: You place the picker inside a complex dashboard.
- **Custom Themes**: You use the picker as a base for your own UI styling.
