# ``SymbolPicker/SymbolPickerSymbolsStyle/id``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "14.0")
    @DocumentationExtension(mergeBehavior: override)
}

A property of the `SymbolPickerSymbolsStyle` enum that returns a unique identifier for the style case.

## Overview

The `id` property returns an `Int` value that uniquely identifies a `SymbolPickerSymbolsStyle` case, enabling its use in SwiftUI lists or data models that require `Identifiable` conformance. The `filled` case has an `id` of `0`, and the `outlined` case has an `id` of `1`. The table below lists each style along with its name, ID, and description, with the `id` property corresponding to the ID column.

### Style Grid
| Style Name | ID | Description |
|------------|----|-------------|
| Filled     | 0  | Renders the symbol with a solid fill, suitable for bold and prominent visuals. |
| Outlined   | 1  | Renders the symbol with a stroked outline, ideal for a lighter, minimalistic appearance. |
