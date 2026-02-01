# ``SymbolPicker/SymbolPickerSymbolsStyle/filled``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

A case of the `SymbolPickerSymbolsStyle` enum that renders symbols with a solid fill.

## Overview

The `filled` case specifies that symbols in a `SymbolPicker` view should be rendered with a solid fill, providing a bold and prominent appearance. It has a fixed `id` of `0` and is applied using the `.symbolPickerSymbolsStyle(.filled)` modifier. This style is ideal for UI designs where symbols need to stand out with a filled, opaque look.

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var symbolName = "star"
    @State private var isPresented = true
    
    var body: some View {
        Button("Select Symbol") {
            isPresented.toggle()
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName)
            .symbolPickerSymbolsStyle(.filled)
    }
}
```

## Design Images

@TabNavigator {
    @Tab("iOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolStyle-Filled-iOS", alt: "Filled") { Filled }
            }
        }
    }
    @Tab("iPadOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolStyle-Filled-iPadOS", alt: "Filled") { Filled }
            }
        }
    }
    @Tab("macOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolStyle-Filled-macOSTahoe", alt: "Filled") { Filled }
            }
        }
    }
    @Tab("visionOS") {
        @Row(numberOfColumns: 1) {
            @Column {
                @Image(source: "Documentation-SymbolStyle-Filled-visionOS", alt: "Filled") { Filled }
            }
        }
    }
}
