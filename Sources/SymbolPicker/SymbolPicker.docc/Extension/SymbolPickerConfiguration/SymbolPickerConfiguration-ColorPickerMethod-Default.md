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


Returns an optional ``SymbolPicker/SPColorPickerConfiguration`` for the integrated ``SymbolPicker/SPColorPicker`` view.

- Returns: An ``SymbolPicker/SPColorPickerConfiguration`` if color selection is enabled; otherwise, `nil`.

## Default Implementation

```swift
func colorPickerConfiguration() -> SPColorPickerConfiguration? { return .init(style: displayStyle) }
```

The `colorPickerConfiguration()` method controls the availability and setup of the color picker tool. If this method returns `nil`, the ``SymbolPicker/SPColorPicker`` will be completely disabled within the picker UI.

### Configuration Options

The configuration object allows you to customize:
- **Enabled State**: Toggle the picker's visibility.
- **Color Palette**: Provide a custom list of colors for the grid.
- **Layout**: Choose between a standard grid or a horizontal list.
- **Advanced Features**: Toggle support for opacity adjustments and custom color selection via a system picker.

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

### Convenience Accessor

For cleaner internal syntax, the configuration provides an `internal` computed property `colorPicker` which acts as a direct wrapper for this method, reducing repetitive function call syntax throughout the codebase.
