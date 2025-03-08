# ``SymbolPicker``

A native macOS component for browsing and selecting SF Symbols with comprehensive style and color customization options.

## Overview

SymbolPicker provides an elegant, native-feeling symbol picker for macOS applications. Built to seamlessly integrate with SwiftUI, this package makes it easy to incorporate Apple's SF Symbols into your application with a familiar interface that users will immediately understand.

![A screenshot of the SymbolPicker component showing a grid of SF Symbols](https://developer.apple.com/assets/elements/icons/sf-symbols-2/sf-symbols-2-96x96_2x.png)

### Key Features

- **Native Design**: Apple-like interface and interaction patterns
- **Comprehensive Symbol Access**: Support for all available SF Symbols
- **Intelligent Organization**: Symbol categorization matching Apple's SF Symbols app
- **Real-time Search**: Dynamic filtering as you type
- **Multiple Color Options**: Choose between RGB values, SwiftUI Color, or predefined SymbolColor
- **Appearance Support**: Full compatibility with dark and light modes
- **Modern Platform Support**: Optimized for macOS 13 and newer

## Getting Started

SymbolPicker offers two primary implementation approaches:

- **Component-based**: Use the `SymbolPicker` view for custom UI implementations
- **Modifier-based**: Apply the `.symbolPicker` modifier for quick, out-of-the-box implementation

## Topics

### Essentials

- <doc:Installation>
- <doc:QuickStart>

### Core Components

- ``SymbolPicker/SymbolPicker``
- ``SymbolPicker/symbolPicker(isPresented:symbolName:symbolColor:)``
- ``SymbolPicker/SymbolColor``

### Color Management

- ``SymbolPicker/SymbolColor/red``
- ``SymbolPicker/SymbolColor/orange``
- ``SymbolPicker/SymbolColor/yellow``
- ``SymbolPicker/SymbolColor/green``
- ``SymbolPicker/SymbolColor/mint``
- ``SymbolPicker/SymbolColor/teal``
- ``SymbolPicker/SymbolColor/cyan``
- ``SymbolPicker/SymbolColor/blue``
- ``SymbolPicker/SymbolColor/indigo``
- ``SymbolPicker/SymbolColor/purple``
- ``SymbolPicker/SymbolColor/magenta``
- ``SymbolPicker/SymbolColor/pink``
- ``SymbolPicker/SymbolColor/grey``
- ``SymbolPicker/SymbolColor/moro``
- ``SymbolPicker/SymbolColor/brown``

## SymbolPicker Component

The `SymbolPicker` view is the core component of the package, which can be embedded directly in your SwiftUI layout.

### Initialization Options

The view provides three flexible initializers to accommodate different color handling preferences:

#### Using RGB Values

```swift
SymbolPicker(
    symbolName: Binding<String>, 
    colorValues: Binding<[Double]>
)
```

This initializer accepts an array of RGB values where:
### - Index 0: Red component (0.0-1.0)
### - Index 1: Green component (0.0-1.0)
### - Index 2: Blue component (0.0-1.0)
### - Index 3: Alpha component (typically 1.0)

#### Using SwiftUI Color

```swift
SymbolPicker(
    symbolName: Binding<String>, 
    color: Binding<Color>
)
```

This initializer works directly with SwiftUI's native `Color` type, providing the most straightforward integration with existing SwiftUI code.

#### Using Predefined SymbolColor

```swift
SymbolPicker(
    symbolName: Binding<String>, 
    symbolColor: Binding<SymbolColor>
)
```

This initializer uses the package's built-in `SymbolColor` enum, offering a curated set of colors that match Apple's standard color palette.

## View Modifiers

For quick implementation, SymbolPicker provides view modifiers that match each initializer option:

### Using RGB Values

```swift
.symbolPicker(
    isPresented: Binding<Bool>,
    symbolName: Binding<String>,
    colorValues: Binding<[Double]>
)
```

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

## Integration Examples

### Basic Integration with RGB Values

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
            
            Text("Selected: \(selectedSymbol)")
                .font(.headline)
            
            Button("Change Symbol") {
                isPickerPresented.toggle()
            }
            .buttonStyle(.borderedProminent)
            .popover(isPresented: $isPickerPresented) {
                SymbolPicker(
                    symbolName: $selectedSymbol,
                    colorValues: $colorValues
                )
                .frame(width: 550, height: 450)
                .padding()
            }
        }
        .padding()
        .frame(minWidth: 300, minHeight: 200)
    }
}
```

### Using SwiftUI Color

```swift
import SwiftUI
import SymbolPicker

struct ColorBasedExample: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var symbolColor: Color = .blue
    @State private var isPickerPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: selectedSymbol)
                .foregroundStyle(symbolColor)
                .font(.system(size: 64))
                .symbolRenderingMode(.multicolor)
            
            Text("Selected: \(selectedSymbol)")
                .font(.headline)
            
            Button("Change Symbol") {
                isPickerPresented.toggle()
            }
            .buttonStyle(.borderedProminent)
            .popover(isPresented: $isPickerPresented) {
                SymbolPicker(
                    symbolName: $selectedSymbol,
                    color: $symbolColor
                )
                .frame(width: 550, height: 450)
                .padding()
            }
        }
        .padding()
    }
}
```

### Using Predefined SymbolColor with Modifier

```swift
import SwiftUI
import SymbolPicker

struct ModifierExample: View {
    @State private var selectedSymbol: String = "car.fill"
    @State private var symbolColor: SymbolColor = .blue
    @State private var isPickerPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: selectedSymbol)
                .foregroundStyle(symbolColor.color)
                .font(.system(size: 64))
                .padding()
            
            Text("Selected: \(selectedSymbol)")
                .font(.headline)
            
            Button("Select Symbol") {
                isPickerPresented.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .symbolPicker(
            isPresented: $isPickerPresented,
            symbolName: $selectedSymbol,
            symbolColor: $symbolColor
        )
    }
}
```

## Requirements

### -  macOS 12.0+
### - Swift 5.4+
### - Xcode 12.5+

## Installation

### Swift Package Manager

Add SymbolPicker to your project by adding the following dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/SzpakKamil/SymbolPicker.git", from: "0.1.0")
]
```

Or add it directly in Xcode using File > Add Packages... and enter the repository URL.
