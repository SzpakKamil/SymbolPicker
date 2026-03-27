# ``SymbolPicker/SymbolPicker/init(systemImage:configuration:)-(Binding<String>,_)``

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

Creates a picker for a required SF Symbol name.

## Overview

This initializer binds the picker to a symbol name string. It ensures the selection state stays in sync with your data.

### Parameters

- **systemImage**: A binding to the SF Symbol name string.
- **configuration**: The layout and style settings for the picker.

### Behavior

The picker updates the provided binding whenever the user selects a new symbol from the grid. This version is ideal for views that require a valid symbol at all times.
