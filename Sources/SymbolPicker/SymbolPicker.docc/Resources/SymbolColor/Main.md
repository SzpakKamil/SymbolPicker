# ``SymbolPicker/SymbolColor``

A type-safe enum representing the standard system colors available for SF Symbols.

## Overview

`SymbolColor` provides a set of predefined system colors that match Apple's standard color palette for SF Symbols. This enum allows you to select from a comprehensive range of colors when customizing symbols in your application.

Each case in the enum corresponds to a specific system color and provides access to the underlying SwiftUI `Color` value.

## Declaration

```swift
public enum SymbolColor: Int, Identifiable, CaseIterable {
    case red = 0
    case orange = 1
    case yellow = 2
    case green = 3
    case mint = 4
    case teal = 5
    case cyan = 6
    case blue = 7
    case indigo = 8
    case purple = 9
    case magenta = 10
    case pink = 11
    case grey = 12
    case moro = 13
    case brown = 14
    
    public var id: Int { self.rawValue }
}
```

## Color Values

Each case in the `SymbolColor` enum provides access to a corresponding SwiftUI `Color` value through the `color` property.

## Topics

### Accessing Color Information

- ``color``
- ``name``
- ``id``

### Available Colors

- ``red``
- ``orange``
- ``yellow``
- ``green``
- ``mint``
- ``teal``
- ``cyan``
- ``blue``
- ``indigo``
- ``purple``
- ``magenta``
- ``pink``
- ``grey``
- ``moro``
- ``brown``

## Usage

### Working with SymbolPicker

```swift
@State private var selectedSymbol: String = "star.fill"
@State private var symbolColor: SymbolColor = .blue

var body: some View {
    SymbolPicker(
        symbolName: $selectedSymbol,
        symbolColor: $symbolColor
    )
}
```

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
@State private var symbolColor: SymbolColor = .red

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

## See Also

- ``SymbolPicker/SymbolPicker``
- ``SymbolPicker/SymbolPicker/init(symbolName:symbolColor:)``
