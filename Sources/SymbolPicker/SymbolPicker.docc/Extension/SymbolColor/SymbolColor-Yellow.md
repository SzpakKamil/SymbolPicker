# ``SymbolPicker/SymbolColor/yellow``

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

A case of the `SymbolColor` enum representing a yellow color.

## Overview

The `yellow` case provides a predefined yellow color for use in the `SymbolPicker` package, suitable for bright and cheerful UI elements. It has a fixed `id` of `2` and is represented by the RGBA values `[0.925, 0.671, 0.384, 1]`, which create a warm yellow tone.

### RGBA Values
- **Red**: 0.925
- **Green**: 0.671
- **Blue**: 0.384
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.yellow
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
