# ``SymbolPicker/SymbolPickerSymbolsStyle``

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

An enumeration that defines the visual style for symbols in the `SymbolPicker` package.

## Overview

The `SymbolPickerSymbolsStyle` enum specifies the rendering style for symbols in a `SymbolPicker` view, supporting two cases: `filled` and `outlined`. It conforms to `Identifiable`, `Equatable`, `Codable`, and `Hashable`, making it suitable for use in SwiftUI views, data persistence, and collections. The style is applied using the `.symbolPickerSymbolsStyle(_:)` modifier on a `SymbolPicker` view. The `filled` style renders symbols with a solid fill, while the `outlined` style renders symbols with a stroked outline. The table below summarizes the available styles, their IDs, and descriptions.

### Style Grid
| Style Name | ID | Description |
|------------|----|-------------|
| Filled     | 0  | Renders the symbol with a solid fill, suitable for bold and prominent visuals. |
| Outlined   | 1  | Renders the symbol with a stroked outline, ideal for a lighter, minimalistic appearance. |

## Topics

### Cases
- ``SymbolPicker/SymbolPickerSymbolsStyle/filled``
- ``SymbolPicker/SymbolPickerSymbolsStyle/outlined``

### Properties
- ``SymbolPicker/SymbolPickerSymbolsStyle/id``
