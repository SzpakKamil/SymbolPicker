# ``SymbolPicker/SymbolColor/value``

The RGB color components as an array of Double values.

## Overview

The `value` property returns an array of four Double values representing the red, green, blue, and alpha components of the color. Each component is scaled from 0.0 to 1.0, with the alpha value always set to 1.0 (fully opaque).

## Value Grid

| Color Case | value (RGBA) |
|------------|--------------|
| red        | [0.906, 0.392, 0.416, 1] |
| orange     | [0.945, 0.537, 0.427, 1] |
| yellow     | [0.925, 0.671, 0.384, 1] |
| green      | [0.945, 0.749, 0.298, 1] |
| mint       | [0.451, 0.780, 0.435, 1] |
| teal       | [0.216, 0.792, 0.678, 1] |
| cyan       | [0.298, 0.698, 0.945, 1] |
| blue       | [0.259, 0.514, 0.969, 1] |
| indigo     | [0.302, 0.392, 0.737, 1] |
| purple     | [0.490, 0.329, 0.729, 1] |
| magenta    | [0.698, 0.490, 0.871, 1] |
| pink       | [0.906, 0.557, 0.816, 1] |
| grey       | [0.533, 0.565, 0.604, 1] |
| moro       | [0.584, 0.663, 0.592, 1] |
| brown      | [0.651, 0.565, 0.455, 1] |

## Examples

```swift
// Access the RGBA components
let redComponents = SymbolColor.red.value
let redValue = redComponents[0]  // Returns 0.906
let greenValue = redComponents[1]  // Returns 0.392
let blueValue = redComponents[2]  // Returns 0.416
let alphaValue = redComponents[3]  // Returns 1.0

// Create a custom UIColor
let uiColor = UIColor(
    red: CGFloat(symbolColor.value[0]),
    green: CGFloat(symbolColor.value[1]),
    blue: CGFloat(symbolColor.value[2]),
    alpha: CGFloat(symbolColor.value[3])
)
```