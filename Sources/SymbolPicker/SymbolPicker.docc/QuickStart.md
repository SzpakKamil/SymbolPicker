# QuickStart

## Overview

This guide will help you quickly implement SymbolPicker in your macOS SwiftUI application with minimal setup.

## Basic Implementation

SymbolPicker can be added to your application in two primary ways:
1. As a standalone view using the `SymbolPicker` component
2. As a view modifier using the `.symbolPicker()` modifier

### Minimum Viable Implementation

Here's the simplest way to add SymbolPicker to your application:

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var selectedSymbol = "star.fill"
    @State private var showPicker = false
    
    var body: some View {
        VStack {
            // Display the selected symbol
            Image(systemName: selectedSymbol)
                .font(.system(size: 50))
                .padding()
            
            // Button to trigger the picker
            Button("Select Symbol") {
                showPicker.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .symbolPicker(
            isPresented: $showPicker,
            symbolName: $selectedSymbol,
            symbolColor: .constant(.blue)
        )
    }
}
```

This code creates a button that, when clicked, presents the SymbolPicker interface. The selected symbol is displayed in the view.

## Implementation Options

### Using as a Popover

For a more integrated experience, you can present SymbolPicker in a popover:

```swift
import SwiftUI
import SymbolPicker

struct PopoverExample: View {
    @State private var selectedSymbol = "star.fill"
    @State private var symbolColor = SymbolColor.blue
    @State private var showPicker = false
    
    var body: some View {
        VStack {
            Image(systemName: selectedSymbol)
                .foregroundStyle(symbolColor.color)
                .font(.system(size: 50))
                .padding()
            
            Button("Select Symbol") {
                showPicker.toggle()
            }
            .popover(isPresented: $showPicker) {
                SymbolPicker(
                    symbolName: $selectedSymbol,
                    symbolColor: $symbolColor
                )
                .frame(width: 500, height: 400)
                .padding()
            }
        }
        .padding()
    }
}
```

### Using in a Sheet

For a full-screen experience on smaller displays:

```swift
import SwiftUI
import SymbolPicker

struct SheetExample: View {
    @State private var selectedSymbol = "star.fill"
    @State private var colorValues = [0.0, 0.5, 1.0, 1.0] // RGBA
    @State private var showPicker = false
    
    var body: some View {
        VStack {
            Image(systemName: selectedSymbol)
                .foregroundStyle(Color(
                    red: colorValues[0],
                    green: colorValues[1],
                    blue: colorValues[2]
                ))
                .font(.system(size: 50))
                .padding()
            
            Button("Select Symbol") {
                showPicker.toggle()
            }
            .sheet(isPresented: $showPicker) {
                VStack {
                    Text("Choose a Symbol")
                        .font(.headline)
                        .padding()
                    
                    SymbolPicker(
                        symbolName: $selectedSymbol,
                        colorValues: $colorValues
                    )
                    .padding()
                    
                    Button("Done") {
                        showPicker = false
                    }
                    .padding()
                }
                .frame(width: 600, height: 500)
            }
        }
        .padding()
    }
}
```

## Working with Different Color Types

SymbolPicker supports three types of color bindings:

### Using RGB Values

```swift
@State private var colorValues = [0.906, 0.392, 0.416, 1.0] // Red, Green, Blue, Alpha

SymbolPicker(
    symbolName: $selectedSymbol,
    colorValues: $colorValues
)
```

### Using SwiftUI Color

```swift
@State private var symbolColor: Color = .blue

SymbolPicker(
    symbolName: $selectedSymbol,
    color: $symbolColor
)
```

### Using Predefined SymbolColor

```swift
@State private var symbolColor: SymbolColor = .blue

SymbolPicker(
    symbolName: $selectedSymbol,
    symbolColor: $symbolColor
)
```

## Next Steps

After implementing the basic SymbolPicker, you might want to:
- [Customize the appearance and behavior](Customization.md)
- Integrate with your app's settings
- Add color themes that change multiple symbols at once
