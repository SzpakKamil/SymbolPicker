# ``SymbolPicker/SymbolColor/mint``

A refreshing mint color for symbols.

## Overview

The mint color has RGB values [0.451, 0.780, 0.435] and offers a cool, fresh appearance that works well for symbols related to health, wellness, or nature.

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
@State private var symbolColor: SymbolColor = .mint

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