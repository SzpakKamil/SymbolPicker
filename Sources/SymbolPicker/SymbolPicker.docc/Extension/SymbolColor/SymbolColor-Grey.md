# ``SymbolPicker/SymbolColor/grey``

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

A case of the `SymbolColor` enum representing a grey color.

## Overview

The `grey` case provides a predefined grey color for use in the `SymbolPicker` package, suitable for neutral or minimalist UI elements. It has a fixed `id` of `12` and is represented by the RGBA values `[0.533, 0.565, 0.604, 1]`, which create a medium grey tone.

### RGBA Values
- **Red**: 0.533
- **Green**: 0.565
- **Blue**: 0.604
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.grey
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```

