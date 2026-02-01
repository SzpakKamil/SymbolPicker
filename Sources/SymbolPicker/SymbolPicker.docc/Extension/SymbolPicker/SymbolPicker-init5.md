# ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:)``

Initializes a `SymbolPicker` with bindings to control presentation and the selected symbol name, without color customization.

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.0")
    @Available(Xcode, introduced: "15.0")
}
@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

## Overview

This initializer creates a `SymbolPicker` view that binds the presentation state to `isPresented` and the selected SF Symbol name to `symbolName`. No color customization is available (`colorValue` defaults to transparent). This initializer is deprecated in favor of `init(symbolName:)`, which does not require an `isPresented` binding. Use this for legacy support on iOS 14.0+, macOS 11.0+, or visionOS 1.0+. The table below summarizes the initializer’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| `isPresented` | `Binding<Bool>` | A binding controlling whether the picker is presented. |
| `symbolName` | `Binding<String>` | A binding to the selected SF Symbol name. |

## Example

```swift
import SwiftUI
import SymbolPicker

struct ExampleView: View {
    @State private var isPresented = false
    @State private var symbol = "star.fill"

    var body: some View {
        Button("Pick Symbol") {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
            SymbolPicker(isPresented: $isPresented, symbolName: $symbol)
        }
    }
}
```

## Design Images

@TabNavigator {
    @Tab("iOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolPickerInits-Default-iOS", alt: "Default") {}
            }
        }
    }
    @Tab("iPadOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolPickerInits-Default-iPadOS", alt: "Default") {}
            }
        }
    }
    @Tab("macOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolPickerInits-Default-macOSTahoe", alt: "Default") {}
            }
        }
    }
    @Tab("visionOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolPickerInits-Default-visionOS", alt: "Default") {}
            }
        }
    }
}

## Related Initializers
- ``SymbolPicker/SymbolPicker/init(symbolName:)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<Color>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<[Double]>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``
