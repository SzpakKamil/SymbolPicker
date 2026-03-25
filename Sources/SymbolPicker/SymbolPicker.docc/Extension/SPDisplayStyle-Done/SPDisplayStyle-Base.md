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

An enumeration defining the visual presentation style of a `SymbolPicker`.

## Overview

The `SPDisplayStyle` enum allows developers to choose how the picker is presented to the user. Each style offers a different balance of information density and visual complexity, enabling the picker to adapt to various UI contexts.

### Display Options

- **Compact**: A streamlined view focused on quick selection.
- **Detail**: A more comprehensive view providing previews, suitable for primary selection interfaces.
- **Plain**: A simple, unstyled view that can be more easily integrated into custom layouts or lists.

## Topics

### Display Styles

- ``SymbolPicker/SPDisplayStyle/compact``
- ``SymbolPicker/SPDisplayStyle/detail``
- ``SymbolPicker/SPDisplayStyle/plain``
