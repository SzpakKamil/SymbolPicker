# ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:color:)-(_,_,Binding<[Double]>?)``

Initializes a `SymbolPicker` with bindings to control presentation, the selected symbol name, and an RGBA color array.

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

This initializer creates a `SymbolPicker` view that binds the presentation state to `isPresented`, the selected SF Symbol name to `symbolName`, and the symbol’s color to an RGBA array (`[Double]`) via `color`. The `color` binding is optional; if `nil`, the color defaults to transparent. The RGBA array is converted to a `SymbolColor` internally. This initializer is deprecated in favor of `init(symbolName:color:)-7z4k8`. Use this for legacy support on iOS 14.0+, macOS 11.0+, or visionOS 1.0+. The table below summarizes the initializer’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| `isPresented` | `Binding<Bool>` | A binding controlling whether the picker is presented. |
| `symbolName` | `Binding<String>` | A binding to the selected SF Symbol name. |
| `color` | `Binding<[Double]>?` | An optional binding to an RGBA color array (`[R, G, B, A]`). |

## Example

```swift
import SwiftUI
import SymbolPicker

struct ExampleView: View {
    @State private var isPresented = false
    @State private var symbol = "star.fill"
    @State private var color: [Double] = [1.0, 0.0, 0.0, 1.0] // Red

    var body: some View {
        Button("Pick Symbol") {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
            SymbolPicker(isPresented: $isPresented, symbolName: $symbol, color: $color)
        }
    }
}
```

## Design Images

@TabNavigator {
    @Tab("iOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolPickerInits-Color-iOS", alt: "Color") {}
            }
        }
    }
    @Tab("iPadOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolPickerInits-Color-iPadOS", alt: "Color") {}
            }
        }
    }
    @Tab("macOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolPickerInits-Color-macOSTahoe", alt: "Color") {}
            }
        }
    }
    @Tab("visionOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolPickerInits-Color-visionOS", alt: "Color") {}
            }
        }
    }
}

## Related Initializers
- ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<Color>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<[Double]>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``
