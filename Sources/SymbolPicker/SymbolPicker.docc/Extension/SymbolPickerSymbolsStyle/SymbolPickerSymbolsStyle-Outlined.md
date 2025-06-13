# ``SymbolPicker/SymbolPickerSymbolsStyle/outlined``

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

A case of the `SymbolPickerSymbolsStyle` enum that renders symbols with a stroked outline.

## Overview

The `outlined` case specifies that symbols in a `SymbolPicker` view should be rendered with a stroked outline, providing a lighter and minimalistic appearance. It has a fixed `id` of `1` and is applied using the `.symbolPickerSymbolsStyle(.outlined)` modifier. This style is suitable for UI designs where symbols need a subtle, non-intrusive look.

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "star"
    @State private var isPresented = true
    
    var body: some View {
        Button("Select Symbol") {
            isPresented.toggle()
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName)
            .symbolPickerSymbolsStyle(.outlined)
    }
}
```
