# ``SymbolPicker/SwiftUICore/View/``

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

A SwiftUI view modifier that presents a symbol picker interface for selecting SF Symbols.

## Overview

The `.symbolPicker(isPresented:symbolName:)` modifier attaches a symbol picker to a SwiftUI view, allowing users to select an SF Symbol and bind its name to a `String` property. The picker’s presentation is controlled by a `Binding<Bool>`, and it supports an optional color parameter that can be a `Binding<SymbolColor>?`, `Binding<SwiftUI.Color>?`, or `Binding<[Double]>?`, enabling flexible color customization. The color is converted internally to a `SymbolColor` for rendering. Additional modifiers (`.symbolPickerSymbolsStyle(_:)` and `.symbolPickerDismiss(type:action:)`) allow customization of symbol style and dismissal behavior. The table below summarizes the modifier’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| isPresented    | Binding<Bool> | Controls whether the symbol picker is presented. |
| symbolName     | Binding<String> | Binds to the selected symbol’s name (e.g., "star.fill"). |
| color          | Binding<SymbolColor>?, Binding<SwiftUI.Color>?, or Binding<[Double]>? | Optionally binds a color for the selected symbol, using `SymbolColor`, `SwiftUI.Color`, or RGBA `[Double]` values. |

### Example Usage: Basic
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
    }
}
```

### Example Usage: With Different Color Types
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "star"
    @State private var isPresented = false
    @State private var symbolColor = SymbolColor.blue
    @State private var swiftUIColor: Color = .red
    @State private var doubleColor: [Double] = [0.490, 0.329, 0.729, 1.0] // Purple
    
    var body: some View {
        VStack {
            Button("Pick with SymbolColor") {
                isPresented = true
            }
            .symbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $symbolColor)
            
            Button("Pick with SwiftUI Color") {
                isPresented = true
            }
            .symbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $swiftUIColor)
            
            Button("Pick with Double Array") {
                isPresented = true
            }
            .symbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $doubleColor)
        }
    }
}
```

### Example Usage: With Custom Styling Modifiers
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

## See Also
- ``SymbolPicker/SymbolPickerSymbolsStyle``
- ``SymbolPicker/SymbolPickerDismissType``
- ``SymbolPicker/SymbolColor``
- ``SymbolPicker/SymbolPicker``
