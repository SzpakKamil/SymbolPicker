# ``SymbolPicker/SwiftUICore/View/symbolPicker(isPresented:symbolName:color:)-c2aw``

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
Initializes a `SymbolPicker` view modifier with a binding to an array of doubles for the symbol’s color.

## Overview

The `.symbolPicker(isPresented:symbolName:color:)` modifier attaches a symbol picker to a SwiftUI view, allowing users to select an SF Symbol and bind its name to a `String` property, with an optional `Binding<[Double]>` for the symbol’s RGBA color values. The `color` parameter is converted to a `SymbolColor.customColor` for rendering. If `color` is `nil`, a transparent `SymbolColor.customColor([0,0,0,0])` is used. The modifier uses `SymbolPickerData` with default values of `.filled` for `symbolsStyle` and `.manual` for `dismissType`. This initializer is suitable for scenarios where the color is managed as raw RGBA values. The table below summarizes the modifier’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| isPresented    | Binding<Bool> | Controls whether the symbol picker is presented. |
| symbolName     | Binding<String> | Binds to the selected symbol’s name (e.g., "star.fill"). |
| color          | Binding<[Double]>? | Optionally binds an array of RGBA values for the selected symbol’s color. |

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "star"
    @State private var isPresented = false
    @State private var color: [Double] = [0.490, 0.329, 0.729, 1.0] // Purple
    
    var body: some View {
        Button("Show Symbol Picker") {
            isPresented = true
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $color)
        .symbolPickerSymbolsStyle(.filled)
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
