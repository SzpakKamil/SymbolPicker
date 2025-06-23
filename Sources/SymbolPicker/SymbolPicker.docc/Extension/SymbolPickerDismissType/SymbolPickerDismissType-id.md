# ``SymbolPicker/SymbolPickerDismissType/id``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

A property of the `SymbolPickerDismissType` enum that returns a unique identifier for the dismiss type case.

## Overview

The `id` property returns an `Int` value that uniquely identifies a `SymbolPickerDismissType` case, enabling its use in SwiftUI lists or data models that require `Identifiable` conformance. The `onSymbolSelect` case has an `id` of `0`, and the `manual` case has an `id` of `1`. The table below lists each dismiss type along with its name, ID, and description, with the `id` property corresponding to the ID column.

### Dismiss Type Grid
| Dismiss Type Name | ID | Description |
|-------------------|----|-------------|
| OnSymbolSelect    | 0  | Automatically dismisses the picker when a symbol is selected, ideal for quick selections. |
| Manual            | 1  | Requires explicit user action to dismiss the picker, suitable for multi-step interactions. |
