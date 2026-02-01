# ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<[Double]>?)``

Initializes a `SymbolPicker` with bindings to the selected symbol name and an RGBA color array.

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
}
@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

## Overview

This initializer creates a `SymbolPicker` view that binds the selected SF Symbol name to `symbolName` and the symbol’s color to an RGBA array (`[Double]`) via `color`. The picker is not presented by default (`isPresented` is `false`). The `color` binding is optional; if `nil`, the color defaults to transparent. The RGBA array is internally converted to a `SymbolColor`. Use this initializer for precise color specification using RGBA values. The table below summarizes the initializer’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| `symbolName` | `Binding<String>` | A binding to the selected SF Symbol name. |
| `color` | `color: Binding<[Double]?` | An optional binding to an RGBA color array (`[R, G, A]`). |

## Example

```swift
import SwiftUI
import SymbolPicker

struct ExampleView: View {
    @State private var symbol: String = "star.fill"
    @State private var color: [Double] = [1.0, 0.0, 0.0, 1.0] // Red

    var body: some View {
        SymbolPicker(symbolName: $symbol, color: $color)
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
- ``SymbolPicker/SymbolPicker/init(symbolName:)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<Color>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``

