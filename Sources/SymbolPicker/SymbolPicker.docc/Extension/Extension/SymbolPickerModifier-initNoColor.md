# ``SymbolPicker/SwiftUICore/View/symbolPicker(isPresented:symbolName:)``

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

Initializes a `SymbolPicker` view modifier without a color parameter.

## Overview

The `.symbolPicker(isPresented:symbolName:)` modifier attaches a symbol picker to a SwiftUI view, allowing users to select an SF Symbol and bind its name to a `String` property. The picker’s presentation is controlled by a `Binding<Bool>`, and it does not apply a color to the selected symbol, defaulting to a transparent `SymbolColor.customColor([0,0,0,0])` internally. The modifier uses `SymbolPickerData` with default values of `.filled` for `symbolsStyle` and `.manual` for `dismissType`. This initializer is ideal for simple symbol selection without color customization. The table below summarizes the modifier’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| isPresented    | Binding<Bool> | Controls whether the symbol picker is presented. |
| symbolName     | Binding<String> | Binds to the selected symbol’s name (e.g., "star.fill"). |

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "star"
    @State private var isPresented = false
    
    var body: some View {
        Button("Show Symbol Picker") {
            isPresented = true
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName)
        .symbolPickerSymbolsStyle(.filled)
        .symbolPickerDismiss(type: .manual)
    }
}
```

## Topics

### Related Types
- ``SymbolPicker/SymbolPickerData``
- ``SymbolPicker/SymbolPickerSymbolsStyle``
- ``SymbolPicker/SymbolPickerDismissType``
- ``SymbolPicker/SymbolColor``
- ``SymbolPicker/SymbolPicker``
