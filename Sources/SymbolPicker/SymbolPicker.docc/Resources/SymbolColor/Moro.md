# ``SymbolPicker/SymbolColor/moro``

A muted moro green color for symbols.

## Overview

The moro color has RGB values [0.584, 0.663, 0.592] and offers an earthy, natural tone that's calming and organic. It's excellent for symbols related to nature, sustainability, or vintage aesthetics.

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
@State private var symbolColor: SymbolColor = .moro

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