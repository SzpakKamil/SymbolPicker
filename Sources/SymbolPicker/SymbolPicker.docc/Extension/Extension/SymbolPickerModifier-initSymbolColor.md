# ``SymbolPicker/SwiftUICore/View/symbolPicker(isPresented:symbolName:color:)-5hed``

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

Initializes a `SymbolPicker` view modifier with a `SymbolColor` binding.

## Overview

The `.symbolPicker(isPresented:symbolName:color:)` modifier attaches a symbol picker to a SwiftUI view, allowing users to select an SF Symbol and bind its name to a `String` property, with an optional `SymbolColor` binding for the symbol’s color. The `color` parameter directly sets the `SymbolPickerData.colorValue`, supporting predefined colors (e.g., `.blue`) or `customColor`. If `color` is `nil`, a transparent `SymbolColor.customColor([0,0,0,0])` is used. The modifier uses `SymbolPickerData` with default values of `.filled` for `symbolsStyle` and `.manual` for `dismissType`. This initializer is ideal for scenarios using the `SymbolColor` enum. The table below summarizes the modifier’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| isPresented    | Binding<Bool> | Controls whether the symbol picker is presented. |
| symbolName     | Binding<String> | Binds to the selected symbol’s name (e.g., "star.fill"). |
| color          | Binding<SymbolColor>? | Optionally binds a `SymbolColor` for the selected symbol’s color. |

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "star"
    @State private var isPresented = false
    @State private var color = SymbolColor.purple
    
    var body: some View {
        Button("Show Symbol Picker") {
            isPresented = true
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $color)
        .symbolPickerSymbolsStyle(.outlined)
        .symbolPickerDismiss(type: .onSymbolSelect)
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
