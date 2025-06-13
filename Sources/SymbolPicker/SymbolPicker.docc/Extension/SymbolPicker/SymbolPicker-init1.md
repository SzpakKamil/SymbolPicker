# ``SymbolPicker/SymbolPicker/init(symbolName:)``

Initializes a `SymbolPicker` with a binding to the selected symbol name, without color customization.

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "14.0")
}
@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

## Overview

This initializer creates a `SymbolPicker` view that allows selection of an SF Symbol, binding the selected symbol’s name to the provided `symbolName` parameter. The picker is not presented by default (`isPresented` is set to `false`), and no color customization is available (`colorValue` defaults to transparent). Use this initializer for simple symbol selection scenarios, applying modifiers like `.symbolPickerSymbolsStyle(_:)` to customize the symbol style. The table below summarizes the initializer’s parameter.

### Parameters Grid
| Parameter Name | Type | Description |
|----------------|------|-------------|
| `symbolName` | `Binding<String>` | A binding to the selected SF Symbol name. |

## Related Initializers
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<Color>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<[Double]>?)``
- ``SymbolPicker/SymbolPicker/init(symbolName:color:)-(_,Binding<SymbolColor>?)``
