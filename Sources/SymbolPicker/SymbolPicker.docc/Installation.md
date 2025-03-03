# Installation

## Overview

This guide explains how to add the SymbolPicker package to your macOS SwiftUI application using Swift Package Manager.

## Requirements

Before installing SymbolPicker, ensure your development environment meets these requirements:
- macOS 13.0 or later
- Swift 5.7 or later
- Xcode 14.0 or later

## Installation Methods

### Using Xcode

The simplest way to add SymbolPicker to your project is through Xcode's built-in package manager:

1. Open your project in Xcode
2. Select **File > Add Packages...**
3. In the search field of the dialog that appears, enter the repository URL:
   ```
   https://github.com/SzpakKamil/SymbolPicker.git
   ```
4. Select the version rule (recommended: "Up to Next Major Version")
5. Click **Add Package**
6. Select the target where you want to use SymbolPicker
7. Click **Add Package** to finalize the installation

### Using Package.swift

If you're working with a Swift package, add SymbolPicker as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/SzpakKamil/SymbolPicker.git", from: "1.0.0")
]
```

Then, add SymbolPicker to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: ["SymbolPicker"]
),
```

## Importing the Package

Once SymbolPicker is added to your project, import it in your Swift files:

```swift
import SwiftUI
import SymbolPicker
```

## Verification

To verify that SymbolPicker is correctly installed, create a simple implementation:

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "heart.fill"
    @State private var showPicker = false
    
    var body: some View {
        Button("Show SymbolPicker") {
            showPicker.toggle()
        }
        .symbolPicker(
            isPresented: $showPicker,
            symbolName: $symbolName,
            symbolColor: .constant(.blue)
        )
    }
}
```

If your project builds without errors, SymbolPicker is successfully installed.

## Troubleshooting

### Common Issues

**Package Cannot Be Found**
- Verify the repository URL is correct
- Check your internet connection
- Ensure GitHub is accessible from your network

**Version Compatibility Errors**
- Confirm you're using macOS 13.0+ and Xcode 14.0+
- Update your Swift version to 5.7 or later

**Build Failures After Adding the Package**
1. Clean your build folder (**Product > Clean Build Folder**)
2. Close and reopen Xcode
3. Try rebuilding your project

For additional help, visit the [GitHub repository](https://github.com/SzpakKamil/SymbolPicker) or open an issue.

---

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

---

# Customization

## Overview

SymbolPicker offers various customization options to tailor the component to your application's needs. This guide covers the available customization options and provides examples for common scenarios.

## Appearance Customization

### Frame Size

Control the size of the SymbolPicker view:

```swift
SymbolPicker(
    symbolName: $selectedSymbol,
    symbolColor: $symbolColor
)
.frame(width: 550, height: 450) // Adjust to your preferred size
.padding()
```

### Color Theme Integration

Adapt SymbolPicker to respond to your app's color scheme changes:

```swift
@Environment(\.colorScheme) var colorScheme

SymbolPicker(
    symbolName: $selectedSymbol,
    color: $symbolColor
)
.preferredColorScheme(colorScheme)
```

### Custom Background

Add a custom background to the SymbolPicker:

```swift
SymbolPicker(
    symbolName: $selectedSymbol,
    symbolColor: $symbolColor
)
.background(
    RoundedRectangle(cornerRadius: 12)
        .fill(Color(.windowBackgroundColor))
        .shadow(radius: 5)
)
```

## Functional Customization

### Initial State

Set a specific symbol and color as the initial state:

```swift
struct PreConfiguredExample: View {
    // Start with a specific symbol and color
    @State private var selectedSymbol = "macbook.and.iphone"
    @State private var symbolColor: SymbolColor = .purple
    @State private var showPicker = false
    
    var body: some View {
        // Your view content
        
        .symbolPicker(
            isPresented: $showPicker,
            symbolName: $selectedSymbol,
            symbolColor: $symbolColor
        )
    }
}
```

### Symbol Rendering Mode

Customize how the selected symbol is rendered in your view:

```swift
Image(systemName: selectedSymbol)
    .symbolRenderingMode(.multicolor) // Options: .monochrome, .hierarchical, .palette
    .foregroundStyle(symbolColor.color)
    .font(.system(size: 64))
```

### Integration with Form Controls

Create a form row that opens the SymbolPicker:

```swift
Form {
    Section("App Settings") {
        HStack {
            Text("App Icon")
            
            Spacer()
            
            Image(systemName: selectedSymbol)
                .foregroundStyle(symbolColor.color)
            
            Button("Change") {
                showPicker = true
            }
            .buttonStyle(.borderless)
        }
        .padding(.vertical, 4)
    }
}
.symbolPicker(
    isPresented: $showPicker,
    symbolName: $selectedSymbol,
    symbolColor: $symbolColor
)
```

## Advanced Customization

### Custom Symbol Display Group

Create a display that showcases multiple symbols with the same color:

```swift
struct SymbolGroup: View {
    @Binding var symbols: [String]
    @Binding var color: SymbolColor
    @State private var editingIndex = 0
    @State private var showPicker = false
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<symbols.count, id: \.self) { index in
                VStack {
                    Image(systemName: symbols[index])
                        .foregroundStyle(color.color)
                        .font(.system(size: 32))
                        .frame(width: 50, height: 50)
                    
                    Button("Edit") {
                        editingIndex = index
                        showPicker = true
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.small)
                }
            }
        }
        .padding()
        .symbolPicker(
            isPresented: $showPicker,
            symbolName: Binding(
                get: { symbols[editingIndex] },
                set: { symbols[editingIndex] = $0 }
            ),
            symbolColor: $color
        )
    }
}
```

### Custom Category Tabs

Create a component that allows users to switch between saved symbol groups:

```swift
struct SymbolCategories: View {
    @State private var categories = [
        "Navigation": ["location.fill", "map.fill", "compass.fill"],
        "Media": ["play.fill", "pause.fill", "stop.fill"],
        "Communication": ["message.fill", "phone.fill", "envelope.fill"]
    ]
    @State private var selectedCategory = "Navigation"
    @State private var symbolColor: SymbolColor = .blue
    @State private var editingCategory = ""
    @State private var editingIndex = 0
    @State private var showPicker = false
    
    var body: some View {
        VStack {
            Picker("Category", selection: $selectedCategory) {
                ForEach(Array(categories.keys), id: \.self) { key in
                    Text(key).tag(key)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack(spacing: 20) {
                ForEach(0..<(categories[selectedCategory]?.count ?? 0), id: \.self) { index in
                    VStack {
                        Image(systemName: categories[selectedCategory]![index])
                            .foregroundStyle(symbolColor.color)
                            .font(.system(size: 32))
                            .frame(width: 50, height: 50)
                        
                        Button("Edit") {
                            editingCategory = selectedCategory
                            editingIndex = index
                            showPicker = true
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                    }
                }
            }
            .padding()
        }
        .frame(minWidth: 300)
        .symbolPicker(
            isPresented: $showPicker,
            symbolName: Binding(
                get: { categories[editingCategory]?[editingIndex] ?? "" },
                set: { 
                    if var categorySymbols = categories[editingCategory] {
                        categorySymbols[editingIndex] = $0
                        categories[editingCategory] = categorySymbols
                    }
                }
            ),
            symbolColor: $symbolColor
        )
    }
}
```

## Performance Considerations

For optimal performance, consider these tips:

1. **Lazy Loading**: If displaying many symbols, use `LazyVGrid` or `LazyHGrid`
2. **Caching**: Cache symbol selections when appropriate
3. **Size Optimization**: Adjust the frame size based on available screen space

```swift
@Environment(\.displayScale) var displayScale

let idealSize = displayScale > 1.5 ? 
    CGSize(width: 550, height: 450) : 
    CGSize(width: 450, height: 350)

SymbolPicker(
    symbolName: $selectedSymbol,
    symbolColor: $symbolColor
)
.frame(width: idealSize.width, height: idealSize.height)
```

## Conclusion

SymbolPicker's flexible design allows for numerous customization options to fit your application's specific needs. By combining the examples provided, you can create a symbol selection experience that feels native and integrates seamlessly with your app's design language.

For more advanced customization options or specific use cases, refer to the API documentation or explore the examples in the GitHub repository.
