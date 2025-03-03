# ``SymbolPicker/SymbolColor/id``

The unique identifier for the color case.

## Overview

Each `SymbolColor` case has a unique identifier that corresponds to its raw integer value. This property conforms to the `Identifiable` protocol, making it easy to use these colors in SwiftUI lists and collections.

## Value Grid

| Color Case | id Value |
|------------|----------|
| red        | 0        |
| orange     | 1        |
| yellow     | 2        |
| green      | 3        |
| mint       | 4        |
| teal       | 5        |
| cyan       | 6        |
| blue       | 7        |
| indigo     | 8        |
| purple     | 9        |
| magenta    | 10       |
| pink       | 11       |
| grey       | 12       |
| moro       | 13       |
| brown      | 14       |

## Examples

```swift
// Access the id directly
let redID = SymbolColor.red.id  // Returns 0

// Using in ForEach with SwiftUI
ForEach(SymbolColor.allCases) { color in
    ColorSwatch(color: color.color)
        .id(color.id)
}
```