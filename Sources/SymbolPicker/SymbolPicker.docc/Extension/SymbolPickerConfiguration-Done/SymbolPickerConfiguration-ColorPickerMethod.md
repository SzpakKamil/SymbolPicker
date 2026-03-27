# ``SymbolPicker/SymbolPickerConfiguration/colorPickerConfiguration()``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
}

Returns an optional ``SymbolPicker/SPColorPickerConfiguration`` for the color picker.

- Returns: A configuration object if color selection is active. Otherwise, returns `nil`.

## Overview

The `colorPickerConfiguration()` method manages the color picker tool. If you return `nil`, SymbolPicker disables the color selection tool in the UI.

### Options

The configuration object lets you:
- **Toggle Visibility**: Turn the picker on or off.
- **Set Palette**: Provide a list of colors for the grid.
- **Choose Layout**: Switch between a grid or a horizontal list.
- **Enable Features**: Add support for opacity or the system eyedropper.

### Customization

```swift
func colorPickerConfiguration() -> SPColorPickerConfiguration? {
    SPColorPickerConfiguration()
        .spColorPickerEnabled(true)
        .spColorPickerLayout(.grid, spacing: 10)
        .spColorPickerSupportsOpacity(false)
        .spColorPickerColors([.red, .orange, .yellow, .green, .blue, .purple])
}
```
