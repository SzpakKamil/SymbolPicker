# ``SymbolPicker/SymbolColor/magenta``

A vibrant magenta color for symbols.

## Overview

The magenta color has RGB values [0.698, 0.490, 0.871] and creates a bold, energetic appearance with hints of both red and purple. It's ideal for symbols that need to make a statement or stand out.

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
@State private var symbolColor: SymbolColor = .magenta

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