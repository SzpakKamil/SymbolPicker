# ``SymbolPicker/SymbolColor/cyan``

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

A case of the `SymbolColor` enum representing a cyan color.

## Overview

The `cyan` case provides a predefined cyan color for use in the `SymbolPicker` package, ideal for bright and modern UI designs. It has a fixed `id` of `6` and is represented by the RGBA values `[0.298, 0.698, 0.945, 1]`, which produce a vivid cyan tone.

### RGBA Values
- **Red**: 0.298
- **Green**: 0.698
- **Blue**: 0.945
- **Alpha**: 1.0

### Example Usage
```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    let color = SymbolColor.cyan
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(color.color)
    }
}
```
