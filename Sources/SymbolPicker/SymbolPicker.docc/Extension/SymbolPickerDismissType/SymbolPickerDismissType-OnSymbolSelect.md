# ``SymbolPicker/SymbolPickerDismissType/onSymbolSelect``

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

A case of the `SymbolPickerDismissType` enum that automatically dismisses the picker when a symbol is selected.

## Overview

The `onSymbolSelect` case specifies that a `SymbolPicker` view is dismissed automatically as soon as the user selects a symbol. It has a fixed `id` of `0` and is applied using the `.symbolPickerDismiss(type: .onSymbolSelect)` modifier. This dismiss type is suitable for streamlined workflows where a single symbol selection completes the user’s task.

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "star"
    @State private var isPresented = true
    
    var body: some View {
        SymbolPicker(isPresented: .constant(true), symbolName: $symbolName)
            .symbolPickerDismiss(type: .onSymbolSelect)
    }
}
```
