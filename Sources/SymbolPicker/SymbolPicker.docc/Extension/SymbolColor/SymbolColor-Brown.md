# ``SymbolPicker/SymbolColor/brown``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "14.0")
    @DocumentationExtension(mergeBehavior: override)
}

A case of the `SymbolColor` enum representing a brown color.

## Overview

The `brown` case provides a predefined brown color for use in the `SymbolPicker` package, ideal for earthy or natural-themed UI elements. It has a fixed `id` of `14` and is represented by the RGBA values `[0.651, 0.565, 0.455, 1]`, which produce a warm brown tone.

### RGBA Values
- **Red**: 0.651
- **Green**: 0.565
- **Blue**: 0.455
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.brown
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
