# ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``

Initializes a `SymbolPicker` with bindings to the selected symbol name and a `SymbolColor`.

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

This initializer creates a `SymbolPicker` view that binds the selected SF Symbol name to `symbolName` and the symbol name to `color` as a `SymbolColor`. The picker is not presented by default (`isPresented` is set to false`). The `color` binding is optional; if `nil`, the color defaults to transparent. Use this initializer when working directly with `SymbolColor` for advanced color management. The table below summarizes the initializer’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| `symbolName` | `Binding<String>` | A binding to the selected SF Symbol name. |
| `color` | `color: Binding<SymbolColor>?` | An optional binding to the symbol’s `SymbolColor`. |

## Related Initializers
- ``SymbolPicker/SymbolPicker/init(symbolName:)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<Color>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<[Double]>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``
