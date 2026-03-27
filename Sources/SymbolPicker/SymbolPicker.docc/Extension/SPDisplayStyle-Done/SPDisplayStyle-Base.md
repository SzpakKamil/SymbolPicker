# ``SymbolPicker/SPDisplayStyle``

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

An enumeration that sets the visual style for a `SymbolPicker`.

## Overview

You use `SPDisplayStyle` to choose how the picker appears to users. Each style balances information density and visual complexity. This allows the picker to fit into different parts of your app's interface.

### Styles

- **Compact**: A lean view for fast selection.
- **Detail**: A full-featured view with previews for primary selection tasks.
- **Plain**: A basic, unstyled view for custom lists or layouts.

## Topics

### Display Styles

- ``SymbolPicker/SPDisplayStyle/compact``
- ``SymbolPicker/SPDisplayStyle/detail``
- ``SymbolPicker/SPDisplayStyle/plain``
