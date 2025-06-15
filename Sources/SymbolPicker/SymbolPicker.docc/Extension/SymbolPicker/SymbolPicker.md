# ``SymbolPicker/SymbolPicker``

A SwiftUI view that presents an interactive interface for selecting SF Symbols with customizable color and style.

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
@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

## Overview

The `SymbolPicker` view allows users to select SF Symbols from a searchable list, integrated with the `SearchBar` package for filtering by name or description. It supports bindings for the presentation state (`isPresented`), selected symbol name (`symbolName`), and color (`colorValue` as `SymbolColor`). The view adapts to platform-specific layouts: a fixed-size window on macOS, a popover on iPad and visionOS, and a full-screen sheet on iPhone. On iOS 26.0+ and visionOS 26.0+, the selected symbol’s position and scale are animated based on scroll offset, calculated with thresholds to minimize updates. The search functionality uses a 500ms debounced asynchronous task to filter symbols efficiently. Customize the view with modifiers like `.symbolPickerSymbolsStyle(_:)` (e.g., `.filled` or `.outlined`) and `.symbolPickerDismiss(type:action:)` (e.g., `.manual` or `.onSymbolSelect`). The table below summarizes the view’s properties.

### Properties Grid
| Property Name | Type | Description |
|---------------|------|-------------|
| `isPresented` | `Binding<Bool>` | Controls whether the picker is presented. |
| `symbolName` | `Binding<String>` | The selected SF Symbol name. |
| `colorValue` | `Binding<SymbolColor>` | The selected symbol’s color, defaulting to transparent if unset. |
| `searchText` | `State<String>` | The text entered in the search bar for filtering symbols. |
| `dismissType` | `SymbolPickerDismissType` | Determines dismissal behavior (e.g., `.manual`). |
| `symbolsStyle` | `SymbolPickerSymbolsStyle` | Defines symbol rendering style (e.g., `.outlined`). |

### Example Usage
```swift
import SwiftUI
import SymbolPicker
import SearchBar

struct ContentView: View {
    @State private var isPresented = false
    @State private var symbolName = "star"
    @State private var colorValue: SymbolColor = .blue
    
    var body: some View {
        Button("Select Symbol") {
            isPresented = true
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $colorValue)
        .symbolPickerSymbolsStyle(.filled)
        .symbolPickerDismiss(type: .onSymbolSelect)
    }
}
```

### Scroll and Animation Optimization
On iOS 26.0+ and visionOS 26.0+, the `SymbolPicker` calculates the selected symbol’s Y-offset (`offsetCalculated`) and scale (`scaleCalculated`) based on the scroll position (`geometry.bounds.minY`). Updates are throttled with thresholds (0.5 for offset, 0.01 for scale) to reduce recomputations, ensuring smooth animations in the `SPSelectedSymbol` view.

## Topics

### Initializers
- ``SymbolPicker/SymbolPicker/init(symbolName:)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<Color>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<[Double]>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``
- ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:)``
- ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:color:)-(_,_,Binding<Color>?)``
- ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:color:)-(_,_,Binding<[Double]>?)``
- ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:color:)-(_,_,Binding<SymbolColor>?)``

### Modifiers
- ``SymbolPicker/SymbolPicker/symbolPickerSymbolsStyle(_:)``
- ``SymbolPicker/SymbolPicker/symbolPickerDismiss(type:action:)``

### Related Types
- ``SymbolPicker/SymbolColor``
- ``SymbolPicker/SymbolPickerSymbolsStyle``
- ``SymbolPicker/SymbolPickerDismissType``
