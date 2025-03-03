# ``SymbolPicker/SymbolColor/purple``

A regal purple color for symbols.

## Overview

The purple color has RGB values [0.490, 0.329, 0.729] and symbolizes luxury, ambition, and creativity. It's perfect for symbols that need to convey premium quality or innovative thinking.

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
@State private var symbolColor: SymbolColor = .purple

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