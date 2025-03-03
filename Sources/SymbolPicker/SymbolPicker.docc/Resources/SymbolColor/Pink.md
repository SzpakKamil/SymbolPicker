# ``SymbolPicker/SymbolColor/pink``

A soft pink color for symbols.

## Overview

The pink color has RGB values [0.906, 0.557, 0.816] and conveys playfulness, compassion, and warmth. It works well for symbols related to care, love, or friendly interfaces.

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
@State private var symbolColor: SymbolColor = .pink

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