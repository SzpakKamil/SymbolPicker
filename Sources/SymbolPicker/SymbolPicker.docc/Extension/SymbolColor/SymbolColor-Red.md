# ``SymbolPicker/SymbolColor/red``

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

A case of the `SymbolColor` enum representing a red color.

## Overview

The `red` case provides a predefined red color for use in the `SymbolPicker` package, ideal for bold and attention-grabbing UI elements. It has a fixed `id` of `0` and is represented by the RGBA values `[0.906, 0.392, 0.416, 1]`, which produce a vibrant red hue.

### RGBA Values
- **Red**: 0.906
- **Green**: 0.392
- **Blue**: 0.416
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.red
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
