# ``SymbolPicker/SymbolColor/color``

A SwiftUI Color instance created from the RGB values.

## Overview

The `color` property returns a SwiftUI `Color` instance created from the RGB components defined in the `value` property. This property provides a convenient way to use the color directly in SwiftUI views.

## Value Grid

| Color Case | SwiftUI Color (RGB) |
|------------|---------------------|
| red        | Color(red: 0.906, green: 0.392, blue: 0.416) |
| orange     | Color(red: 0.945, green: 0.537, blue: 0.427) |
| yellow     | Color(red: 0.925, green: 0.671, blue: 0.384) |
| green      | Color(red: 0.945, green: 0.749, blue: 0.298) |
| mint       | Color(red: 0.451, green: 0.780, blue: 0.435) |
| teal       | Color(red: 0.216, green: 0.792, blue: 0.678) |
| cyan       | Color(red: 0.298, green: 0.698, blue: 0.945) |
| blue       | Color(red: 0.259, green: 0.514, blue: 0.969) |
| indigo     | Color(red: 0.302, green: 0.392, blue: 0.737) |
| purple     | Color(red: 0.490, green: 0.329, blue: 0.729) |
| magenta    | Color(red: 0.698, green: 0.490, blue: 0.871) |
| pink       | Color(red: 0.906, green: 0.557, blue: 0.816) |
| grey       | Color(red: 0.533, green: 0.565, blue: 0.604) |
| moro       | Color(red: 0.584, green: 0.663, blue: 0.592) |
| brown      | Color(red: 0.651, green: 0.565, blue: 0.455) |

## Examples

```swift
// Using the color directly in a SwiftUI view
Circle()
    .fill(symbolColor.color)
    .frame(width: 44, height: 44)

// Setting foreground style for an SF Symbol
Image(systemName: "star.fill")
    .foregroundStyle(symbolColor.color)
    .font(.largeTitle)

// Applying as a background color
Text("Colored Text")
    .padding()
    .background(symbolColor.color)
    .foregroundColor(.white)
    .cornerRadius(8)
```