# ``SymbolPicker/SymbolPicker/init(emoji:configuration:)-(Binding<SPEmoji?>,_)``

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

Creates a picker for an optional emoji.

## Overview

This initializer binds the picker to an optional emoji. It keeps the picker state in sync with your data.

### Parameters

- **emoji**: A binding to the optional ``SymbolPicker/SPEmoji`` object.
- **configuration**: The layout and style settings for the picker.

### Usage

Use this initializer to let users pick an emoji. The binding becomes `nil` if the user clears the selection.
