# ``SymbolPicker/SymbolPickerDismissType``

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

An enumeration that defines the dismissal behavior for a `SymbolPicker` view.

## Overview

The `SymbolPickerDismissType` enum specifies how a `SymbolPicker` view is dismissed, supporting two cases: `onSymbolSelect` and `manual`. It conforms to `Identifiable`, `Equatable`, `Codable`, and `Hashable`, making it suitable for use in SwiftUI views, data persistence, and collections. The dismiss type is applied using the `.symbolPickerDismissType(_:)` modifier on a `SymbolPicker` view. The `onSymbolSelect` case dismisses the picker automatically when a symbol is selected, while the `manual` case requires explicit user action to dismiss. The table below summarizes the available dismiss types, their IDs, and descriptions.

### Dismiss Type Grid
| Dismiss Type Name | ID | Description |
|-------------------|----|-------------|
| OnSymbolSelect    | 0  | Automatically dismisses the picker when a symbol is selected, ideal for quick selections. |
| Manual            | 1  | Requires explicit user action to dismiss the picker, suitable for multi-step interactions. |

## Topics

### Cases
- ``SymbolPicker/SymbolPickerDismissType/onSymbolSelect``
- ``SymbolPicker/SymbolPickerDismissType/manual``

### Properties
- ``SymbolPicker/SymbolPickerDismissType/id``
