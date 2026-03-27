# ``SymbolPicker/SymbolPickerConfiguration/optionListConfiguration()-2d7xc``

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

Returns an ``SymbolPicker/SPOptionListConfiguration`` for styling the asset grid.

- Returns: A configuration object for the main symbol and emoji list.

## Default Implementation

```swift
func optionListConfiguration() -> SPOptionListConfiguration { return .init() }
```

The `optionListConfiguration()` method provides granular control over the ``SymbolPicker/SPOptionList``. It sets the look of individual items in their normal, selected, focused, and pressed states.

### Styling Options

- **Corner Radius**: Set the rounding for grid items.
- **Padding**: Adjust the space inside each item.
- **State Colors**: Set foreground and background colors for every interaction state.

### Customization

```swift
func optionListConfiguration() -> SPOptionListConfiguration {
    SPOptionListConfiguration()
        .spOptionListCornerRadiusFactor(1.0) // Circle items
        .spOptionListForegroundSelected(.white)
        .spOptionListBackgroundSelected(.blue)
        .spOptionListInnerPaddingFactor(0.2)
}
```
