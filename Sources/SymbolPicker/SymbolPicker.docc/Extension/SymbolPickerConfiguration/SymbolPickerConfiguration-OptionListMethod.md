# ``SymbolPicker/SymbolPickerConfiguration/optionListConfiguration()``

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

Returns an ``SymbolPicker/SPOptionListConfiguration`` which governs the styling of the main ``SymbolPicker/SPOptionList`` grid.

- Returns: A configuration object for the main symbol/emoji list.

## Overview

The `optionListConfiguration()` method provides granular control over the ``SymbolPicker/SPOptionList``. It defines the appearance of individual items in their various states: normal, selected, focused, and pressed.

### Styling Options

- **Corner Radius**: Adjust the corner radius of individual grid items.
- **Padding**: Control the inner padding within each item.
- **State Colors**: Customize the foreground and background colors for each interaction state.

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
