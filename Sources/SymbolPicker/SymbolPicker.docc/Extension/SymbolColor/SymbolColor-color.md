# ``SymbolPicker/SymbolColor/color``

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

A property of the `SymbolColor` enum that returns a SwiftUI `Color` for the color case.

## Overview

The `color` property returns a SwiftUI `Color` object derived from the `value` property’s RGBA components, using the red, green, and blue values (ignoring alpha for SwiftUI’s RGB color space). This property is designed for direct use in SwiftUI views to apply the color to UI elements like symbols or text. The table below displays the `value`, `name`, `color`, and `id` properties for each predefined color, with the `color` property corresponding to the RGB values column.

### Color Grid
| Color | Value | Name | Color | ID |
|-------|-------|------|-------|----|
| Red | [0.906, 0.392, 0.416, 1] | Red | rgb(231, 100, 106) | 0 |
| Orange | [0.945, 0.537, 0.427, 1] | Orange | rgb(241, 137, 109) | 1 |
| Yellow | [0.925, 0.671, 0.384, 1] | Yellow | rgb(236, 171, 98) | 2 |
| Green | [0.945, 0.749, 0.298, 1] | Green | rgb(241, 191, 76) | 3 |
| Mint | [0.451, 0.780, 0.435, 1] | Mint | rgb(115, 199, 111) | 4 |
| Teal | [0.216, 0.792, 0.678, 1] | Teal | rgb(55, 202, 173) | 5 |
| Cyan | [0.298, 0.698, 0.945, 1] | Cyan | rgb(76, 178, 241) | 6 |
| Blue | [0.259, 0.514, 0.969, 1] | Blue | rgb(66, 131, 247) | 7 |
| Indigo | [0.302, 0.392, 0.737, 1] | Indigo | rgb(77, 100, 188) | 8 |
| Purple | [0.490, 0.329, 0.729, 1] | Purple | rgb(125, 84, 186) | 9 |
| Magenta | [0.698, 0.490, 0.871, 1] | Magenta | rgb(178, 125, 222) | 10 |
| Pink | [0.906, 0.557, 0.816, 1] | Pink | rgb(231, 142, 208) | 11 |
| Grey | [0.533, 0.565, 0.604, 1] | Grey | rgb(136, 144, 154) | 12 |
| Moro | [0.584, 0.663, 0.592, 1] | Moro | rgb(149, 169, 151) | 13 |
| Brown | [0.651, 0.565, 0.455, 1] | Brown | rgb(166, 144, 116) | 14 |
