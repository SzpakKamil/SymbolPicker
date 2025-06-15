# ``SymbolPicker/SymbolPickerDismissType/manual``

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

A case of the `SymbolPickerDismissType` enum that requires explicit user action to dismiss the picker.

## Overview

The `manual` case specifies that a `SymbolPicker` view remains presented until the user explicitly dismisses it, such as by tapping a cancel button or other UI element. It has a fixed `id` of `1` and is applied using the `.symbolPickerDismiss(type: .manual)` modifier. This dismiss type is ideal for scenarios where users may need to interact with the picker multiple times before finalizing their selection.

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "star"
    @State private var isPresented = true
    
    var body: some View {
        SymbolPicker(isPresented: .constant(true), symbolName: $symbolName)
            .symbolPickerDismiss(type: .manual)
    }
}
```
