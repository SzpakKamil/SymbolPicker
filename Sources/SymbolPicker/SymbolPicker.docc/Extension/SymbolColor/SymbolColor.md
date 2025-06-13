# ``SymbolPicker/SymbolColor``

A type that defines a set of predefined colors and a custom color option for use in a `SymbolPicker`.

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
@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

## Overview

`SymbolColor` is a core component of the `SymbolPicker` package, used to define colors for symbols in a SwiftUI application. It provides a set of 15 predefined colors (such as `red`, `orange`, and `purple`) and a `customColor` case for user-defined RGBA values. Each color has an associated identifier, name, RGBA values, and a SwiftUI `Color` representation, making it suitable for use in SwiftUI views, data persistence, and sorting. The enum conforms to `Identifiable`, `Equatable`, `Comparable`, `Codable`, `CaseIterable`, and `Hashable`, enabling flexible integration with SwiftUI and SwiftData.

Use `SymbolColor` to customize the appearance of symbols in a `SymbolPicker` or other SwiftUI components. The enum’s `color` property provides a SwiftUI `Color` for rendering, and its `allCases` property allows iteration over predefined colors.

## Color Grid

The following table lists all predefined colors available in `SymbolColor`, including their names, IDs, and RGBA values:

| Color Name | ID | RGBA Values |
|------------|----|-------------|
| Red        | 0  | [0.906, 0.392, 0.416, 1] |
| Orange     | 1  | [0.945, 0.537, 0.427, 1] |
| Yellow     | 2  | [0.925, 0.671, 0.384, 1] |
| Green      | 3  | [0.945, 0.749, 0.298, 1] |
| Mint       | 4  | [0.451, 0.780, 0.435, 1] |
| Teal       | 5  | [0.216, 0.792, 0.678, 1] |
| Cyan       | 6  | [0.298, 0.698, 0.945, 1] |
| Blue       | 7  | [0.259, 0.514, 0.969, 1] |
| Indigo     | 8  | [0.302, 0.392, 0.737, 1] |
| Purple     | 9  | [0.490, 0.329, 0.729, 1] |
| Magenta    | 10 | [0.698, 0.490, 0.871, 1] |
| Pink       | 11 | [0.906, 0.557, 0.816, 1] |
| Grey       | 12 | [0.533, 0.565, 0.604, 1] |
| Moro       | 13 | [0.584, 0.663, 0.592, 1] |
| Brown      | 14 | [0.651, 0.565, 0.455, 1] |

## Conformances

### Identifiable
- Provides a unique `id` for each color, used in SwiftUI lists and data models.
- The `id` is a `Double`, computed based on the color case or a custom calculation for `customColor`.

### Equatable
- Enables comparison of `SymbolColor` instances based on their `id` or RGBA values for `customColor`.
- Supports equality checks in SwiftUI views and collections.

### Comparable
- Allows sorting of `SymbolColor` instances based on their `id`.
- Useful for ordered displays of colors.

### Codable
- Supports serialization and deserialization for use with SwiftData or JSON storage.

### CaseIterable
- Provides access to all predefined color cases via `allCases`, excluding `customColor`.

### Hashable
- Enables use in sets or dictionaries for unique color identification.

## Topics

### Cases
- ``SymbolColor/red``
- ``SymbolColor/orange``
- ``SymbolColor/yellow``
- ``SymbolColor/green``
- ``SymbolColor/mint``
- ``SymbolColor/teal``
- ``SymbolColor/cyan``
- ``SymbolColor/blue``
- ``SymbolColor/indigo``
- ``SymbolColor/purple``
- ``SymbolColor/magenta``
- ``SymbolColor/pink``
- ``SymbolColor/grey``
- ``SymbolColor/moro``
- ``SymbolColor/brown``
- ``SymbolColor/customColor(_:)``

### Properties
- ``SymbolColor/id``
- ``SymbolColor/name``
- ``SymbolColor/value``
- ``SymbolColor/color``
- ``SymbolColor/allCases``

## See Also
- ``SymbolPicker``
