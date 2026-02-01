# ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<Color>?)``

Initializes a `SymbolPicker` with bindings to the selected symbol name and a SwiftUI `Color`.

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

This initializer creates a `SymbolPicker` view that binds the selected SF Symbol name to `symbolName` and the symbol’s color to a SwiftUI `Color` via `color`. The picker is not presented by default (`isPresented` is `false`). The `color` binding is optional; if `nil`, the color defaults to transparent. The color is internally converted to a `SymbolColor` for rendering. Use this initializer when integrating with SwiftUI’s native color system. The table below summarizes the initializer’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| `symbolName` | `Binding<String>` | A binding to the selected SF Symbol name. |
| `color` | `Binding<Color>?` | An optional binding to the symbol’s SwiftUI `Color`. |

## Example

```swift
import SwiftUI
import SymbolPicker

struct ExampleView: View {
    @State private var symbol: String = "star.fill"
    @State private var color: Color = .red

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
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<[Double]>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``
