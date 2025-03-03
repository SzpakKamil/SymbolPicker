# ``SymbolPicker/SymbolColor/cyan``

A bright cyan color for symbols.

## Overview

The cyan color has RGB values [0.298, 0.698, 0.945] and offers a vibrant blue-green hue that's eye-catching and modern, perfect for symbols related to water, technology, or communication.

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
@State private var symbolColor: SymbolColor = .cyan

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