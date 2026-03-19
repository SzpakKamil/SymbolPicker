# ``SymbolPicker/SPOptionListConfiguration``

A struct that defines the visual styling and layout for the option list in the SymbolPicker.

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

## Overview

`SPOptionListConfiguration` provides detailed control over the look and feel of the list items within the SymbolPicker. This includes corner radius, padding factors, and color settings for various states (selected, focused, pressed).

### View Integration

This configuration is primarily used by the ``SymbolPicker/SPOptionList`` and its individual asset cells (symbols and emojis).

- **Grid Appearance**: The ``optionListCornerRadiusFactor`` and ``optionListInnerPaddingFactor`` determine the shape and spacing of each item in the picker's main scrollable grid. These factors are relative to the overall item size.
- **State Feedback**: You can define distinct background and foreground colors for four different interaction states:
    - **Default**: The standard state for non-selected items.
    - **Selected**: Highlight for the item currently chosen by the user.
    - **Focused**: Visual feedback for keyboard or remote focus (especially on tvOS).
    - **Pressed**: Feedback for active touch or click interactions.

### Usage Example

```swift
let configuration = SPOptionListConfiguration()
    .spOptionListCornerRadiusFactor(0.5)
    .spOptionListBackgroundSelected(.blue.opacity(0.2))
    .spOptionListForegroundSelected(.blue)
```

## Topics

### Sizing & Layout
Properties that control the shape and padding of list items.

- ``SymbolPicker/SPOptionListConfiguration/optionListCornerRadiusFactor``
- ``SymbolPicker/SPOptionListConfiguration/optionListInnerPaddingFactor``

### Foreground Colors
Color settings for text and icons in different interaction states.

- ``SymbolPicker/SPOptionListConfiguration/optionListForeground``
- ``SymbolPicker/SPOptionListConfiguration/optionListForegroundSelected``
- ``SymbolPicker/SPOptionListConfiguration/optionListForegroundFocused``
- ``SymbolPicker/SPOptionListConfiguration/optionListForegroundPressed``

### Background Colors
Color settings for list item backgrounds in different interaction states.

- ``SymbolPicker/SPOptionListConfiguration/optionListBackground``
- ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundSelected``
- ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundFocused``
- ``SymbolPicker/SPOptionListConfiguration/optionListBackgroundPressed``

### Modification Methods
Chainable methods for updating configuration properties.

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
