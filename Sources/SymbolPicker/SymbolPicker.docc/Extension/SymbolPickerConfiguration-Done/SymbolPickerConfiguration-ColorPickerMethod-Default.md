# ``SymbolPicker/SymbolPickerConfiguration/colorPickerConfiguration()-6p73j``

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

## Default Implementation

```swift
func colorPickerConfiguration() -> SPColorPickerConfiguration? { return .init(style: displayStyle) }
```

The `colorPickerConfiguration()` method sets up the color selection tool. Returning `nil` disables the ``SymbolPicker/SPColorPicker`` in the picker UI.

### Options

Use the configuration object to:
- **Toggle Visibility**: Show or hide the picker.
- **Set Palette**: Provide a custom color list for the grid.
- **Choose Layout**: Switch between a grid or a horizontal row.
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
