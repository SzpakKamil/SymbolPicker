# `SymbolPicker`

A customizable SwiftUI view that allows users to browse, search, and select SF Symbols with color options.

## Overview

`SymbolPicker` provides a comprehensive interface for selecting SF Symbols in your SwiftUI application. The view includes a color picker at the top, a search field for finding specific symbols, and a scrollable grid of symbols organized by categories.
<!---->
<!--![A screenshot of the SymbolPicker interface showing the color options at the top, a search field, and a grid of SF Symbols.](placeholder-image)-->

## Features

- Browse SF Symbols organized in 29 categories
- Search symbols by name
- Select from predefined color options
- Visual indication of selected symbol and color
- Support for both light and dark mode

## Usage

You can initialize a `SymbolPicker` in several ways, depending on how you want to handle the color value:

```swift
// Using a Color binding
@State private var selectedSymbol: String = "star.fill"
@State private var selectedColor: Color = .blue

var body: some View {
    SymbolPicker(symbolName: $selectedSymbol, color: $selectedColor)
}

// Using an array of color values [r, g, b, alpha]
@State private var selectedSymbol: String = "star.fill"
@State private var colorValues: [Double] = [0.0, 0.0, 1.0, 1.0] // Blue

var body: some View {
    SymbolPicker(symbolName: $selectedSymbol, colorValues: $colorValues)
}

// Using a SymbolColor enum
@State private var selectedSymbol: String = "star.fill"
@State private var symbolColor: SymbolColor = .blue

var body: some View {
    SymbolPicker(symbolName: $selectedSymbol, symbolColor: $symbolColor)
}
```

## Symbol Categories

The picker organizes symbols into the following categories:

- Maps
- Devices
- Transport
- Automotive
- Health
- Objects & Tools
- Gaming
- Home
- Commerce
- Weather
- Nature
- Human
- Keyboard
- Camera & Photos
- Communication
- Media
- Connectivity
- Fitness
- Accessibility
- Time
- Privacy & Security
- Editing
- People
- Symbols
- Arrows
- Shapes
- Maths
- Indices
- Text Formatting

## Layout

The `SymbolPicker` view has a fixed size of 310×430 points and includes:

- A color selection grid at the top
- A search field for filtering symbols
- A scrollable list of symbols organized by category

When a search is active, the view displays matching symbols across all categories in a unified grid.

## Topics

### Creating a Symbol Picker

- ``SymbolPicker/SymbolPicker/init(symbolName:color:)``
- ``SymbolPicker/SymbolPicker/init(symbolName:colorValues:)``
- ``SymbolPicker/SymbolPicker/init(symbolName:symbolColor:)``

### View Components

- ``SymbolPicker/SymbolPicker/colorPicker``
- ``SymbolPicker/SymbolPicker/searchField``
- ``SymbolPicker/SymbolPicker/symbolsList``
- ``SymbolPicker/SymbolPicker/symbolDictionary``
- ``SymbolPicker/SymbolPicker/colorOption(for:)``
- ``SymbolPicker/SymbolPicker/symbolButton(for:)``
