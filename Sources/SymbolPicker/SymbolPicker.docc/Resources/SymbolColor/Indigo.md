# ``SymbolPicker/SymbolColor/indigo``

A deep indigo color for symbols.

## Overview

The indigo color has RGB values [0.302, 0.392, 0.737] and provides a rich, deep blue-purple hue that conveys wisdom, intuition, and creativity, making it suitable for symbols related to knowledge or inspiration.

## Examples

### Accessing the Color Value

```swift
Image(systemName: "star.fill")
    .foregroundStyle(symbolColor.color)
    .font(.largeTitle)
```

### Using with Symbol Picker Modifier

```swift
@State private var isPickerPresented: Bool = false
@State private var selectedSymbol: String = "star.fill"
@State private var symbolColor: SymbolColor = .indigo

var body: some View {
    Button("Select Symbol") {
        isPickerPresented.toggle()
    }
    .symbolPicker(
        isPresented: $isPickerPresented,
        symbolName: $selectedSymbol,
        symbolColor: $symbolColor
    )
}
```