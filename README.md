# ``SymbolPicker``

A native macOS component for browsing and selecting SF Symbols with style and color customization.

## Overview

SymbolPicker provides an elegant, native-feeling symbol picker for macOS applications. Built to seamlessly integrate with SwiftUI, this package makes it easy to incorporate Apple's SF Symbols into your application with a familiar interface that users will immediately understand.


The package offers two primary ways to implement symbol picking:
- The `SymbolPicker` view component for custom UI implementations
- The `.symbolPicker` view modifier for quick, out-of-the-box implementation with three flexible color binding options

## Features

- Native Apple-like design and behavior
- Support for all available SF Symbols
- Symbol categorization matching Apple's organization
- Dynamic search functionality
- Customizable symbol rendering styles
- Multiple color selection options (RGB values, SwiftUI Color, or predefined SymbolColor)
- Dark and light mode compatibility
- macOS 13+ optimization

## Topics

### Essentials

- ``SymbolPicker``
- ``symbolPicker(isPresented:symbolName:colorValues:)``
- ``symbolPicker(isPresented:symbolName:color:)``
- ``symbolPicker(isPresented:symbolName:symbolColor:)``

### Views

- ``SymbolPicker``
- ``CategoryView``
- ``SymbolGrid``

### Supporting Types

- ``SymbolColor``
- ``SymbolPickerModifier``
- ``SymbolCategory``

## Symbol Picker Component

The core component of the package is the `SymbolPicker` view which can be embedded directly in your SwiftUI layout:

```swift
SymbolPicker(
    symbolName: Binding<String>,
    colorValues: Binding<[Double]>
)
```

## Symbol Picker Modifiers

The package provides three flexible modifier options to accommodate different color binding preferences:

### Using RGB Values

```swift
.symbolPicker(
    isPresented: Binding<Bool>,
    symbolName: Binding<String>,
    colorValues: Binding<[Double]>
)
```

or

### Using SwiftUI Color

```swift
.symbolPicker(
    isPresented: Binding<Bool>,
    symbolName: Binding<String>,
    color: Binding<Color>
)
```

### Using Predefined SymbolColor

```swift
.symbolPicker(
    isPresented: Binding<Bool>,
    symbolName: Binding<String>,
    symbolColor: Binding<SymbolColor>
)
```

## SymbolColor Options

The package includes a comprehensive set of predefined colors matching Apple's standard color palette:

- `.red`
- `.orange`
- `.yellow`
- `.green`
- `.mint`
- `.teal`
- `.cyan`
- `.blue`
- `.indigo`
- `.purple`
- `.magenta`
- `.pink`
- `.grey`
- `.moro`
- `.brown`

## Example

Here's a complete example showing how to implement a symbol picker in your app:

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var colorValues = [0.906, 0.392, 0.416, 1]
    @State private var isPickerPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Display the currently selected symbol
            Image(systemName: selectedSymbol)
                .foregroundStyle(Color(
                    red: colorValues[0],
                    green: colorValues[1],
                    blue: colorValues[2]
                ))
                .font(.system(size: 64))
            
            Text("Current symbol: \(selectedSymbol)")
                .font(.headline)
            
            // Button to show the picker
            Button("Change Symbol") {
                isPickerPresented.toggle()
            }
            .popover(isPresented: $isPickerPresented) {
                SymbolPicker(
                    symbolName: $selectedSymbol,
                    colorValues: $colorValues
                )
                .frame(width: 500, height: 400)
            }
        }
        .padding()
        .frame(width: 300, height: 200)
    }
}
```

### Example Using Predefined Colors

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var symbolColor: SymbolColor = .blue
    @State private var isPickerPresented: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: selectedSymbol)
                .font(.system(size: 64))
                .padding()
            
            Button("Select Symbol") {
                isPickerPresented.toggle()
            }
        }
        .symbolPicker(
            isPresented: $isPickerPresented,
            symbolName: $selectedSymbol,
            symbolColor: $symbolColor
        )
    }
}
```

## Integration with Other Frameworks

SymbolPicker is designed to work seamlessly with other SwiftUI components and can be easily integrated into various UI patterns:

- Use with `NavigationView` for hierarchical navigation
- Embed in `Form` for settings interfaces
- Incorporate into `List` for selection interfaces
- Use with `TabView` for multi-pane interfaces

## Requirements

- macOS 12.0+
- Swift 5.7+
- Xcode 14.0+
