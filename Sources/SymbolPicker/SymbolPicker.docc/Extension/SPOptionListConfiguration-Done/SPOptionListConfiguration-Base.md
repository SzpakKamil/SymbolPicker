# ``SymbolPicker/SPOptionListConfiguration``

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
    @AutomaticArticleSubheading(disabled)
}

Configures the look and layout of the asset grid.

## Overview

`SPOptionListConfiguration` sets the appearance of items in the SymbolPicker. It controls rounding, padding, and colors for interaction states.

### Integration

The ``SymbolPicker/SPOptionList`` uses this configuration to render symbols and emojis.

- **Grid Appearance**: Properties like ``optionListCornerRadiusFactor`` and ``optionListInnerPaddingFactor`` set the shape and spacing of each item. These values scale with the overall item size.
- **Interactions**: You can set unique background and foreground colors for four states:
    - **Default**: The standard look for unselected items.
    - **Selected**: The highlight for the user's choice.
    - **Focused**: Feedback for keyboard or remote focus.
    - **Pressed**: Feedback for active touch or click.

### Example

```swift
let configuration = SPOptionListConfiguration()
    .spOptionListCornerRadiusFactor(0.5)
    .spOptionListBackgroundSelected(.blue.opacity(0.2))
    .spOptionListForegroundSelected(.blue)
```

## Topics

### Sizing & Layout
- ``SymbolPicker/SPOptionListConfiguration/optionListCornerRadiusFactor``
- ``SymbolPicker/SPOptionListConfiguration/optionListInnerPaddingFactor``

### Foreground Colors
- ``SymbolPicker/SPOptionListConfiguration/optionListForeground``
- ``SymbolPicker/SPOptionListConfiguration/optionListForegroundSelected``
- ``SymbolPicker/SPOptionListConfiguration/optionListForegroundFocused``
- ``SymbolPicker/SPOptionListConfiguration/optionListForegroundPressed``

### Background Colors
- ``SymbolPicker/SPOptionListConfiguration/optionListBackground``
- ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundSelected``
- ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundFocused``
- ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundPressed``

### Modification Methods
- ``SymbolPicker/SPOptionListConfiguration/spOptionListCornerRadiusFactor(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListInnerPaddingFactor(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListForeground(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListForegroundSelected(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListForegroundFocused(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListForegroundPressed(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListBackground(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListBackgroundSelected(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListBackgroundFocused(_:)``
- ``SymbolPicker/SPOptionListConfiguration/spOptionListBackgroundPressed(_:)``
