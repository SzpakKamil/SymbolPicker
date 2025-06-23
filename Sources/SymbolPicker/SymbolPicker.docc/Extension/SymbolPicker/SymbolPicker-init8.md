# ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:color:)-(_,_,Binding<SymbolColor>?)``

Initializes a `SymbolPicker` with bindings to control presentation, the selected symbol name, and a `SymbolColor`.

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

This initializer creates a `SymbolPicker` view that binds the presentation state to `isPresented`, the selected SF Symbol name to `symbolName`, and the symbol’s color to a `SymbolColor` via `color`. The `color` binding is optional; if `nil`, the color defaults to transparent. This initializer is deprecated in favor of `init(symbolName:color:)-3k7x9`. Use this for legacy support on iOS 14.0+, macOS 11.0+, or visionOS 1.0+. The table below summarizes the initializer’s parameters.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| `isPresented` | `Binding<Bool>` | A binding controlling whether the picker is presented. |
| `symbolName` | `Binding<String>` | A binding to the selected SF Symbol name. |
| `color` | `Binding<SymbolColor>?` | An optional binding to the symbol’s `SymbolColor`. |

## Related Initializers
- ``SymbolPicker/SymbolPicker/init(isPresented:symbolName:)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<Color>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<[Double]>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``
