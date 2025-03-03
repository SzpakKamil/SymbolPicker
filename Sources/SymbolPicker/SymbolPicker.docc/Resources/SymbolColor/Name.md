# ``SymbolPicker/SymbolColor/name``

The display name of the color.

## Overview

The `name` property returns a human-readable string representation of each color case. This is useful for displaying color options in user interfaces and for accessibility purposes.

## Value Grid

| Color Case | name Value |
|------------|------------|
| red        | "Red"      |
| orange     | "Orange"   |
| yellow     | "Yellow"   |
| green      | "Green"    |
| mint       | "Mint"     |
| teal       | "Teal"     |
| cyan       | "Cyan"     |
| blue       | "Blue"     |
| indigo     | "Indigo"   |
| purple     | "Purple"   |
| magenta    | "Magenta"  |
| pink       | "Pink"     |
| grey       | "Grey"     |
| moro       | "Moro"     |
| brown      | "Brown"    |

## Examples

```swift
// Access the name directly
let colorName = SymbolColor.red.name  // Returns "Red"

// Using in a SwiftUI Text view
Text("Selected color: \(symbolColor.name)")

// Using in a color selection picker
Picker("Color", selection: $selectedColor) {
    ForEach(SymbolColor.allCases) { color in
        Text(color.name).tag(color)
    }
}
```