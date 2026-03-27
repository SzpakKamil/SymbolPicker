# ``SymbolPicker/SPColorPicker/init()``

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

Creates a color picker.

## Overview

The `init()` initializer builds an `SPColorPicker` that uses values from the environment.

### Requirements

The picker uses these environment factors:
1. **Selection Context**: The shared ``SymbolPicker/SPSelection``.
2. **Configuration**: The ``SymbolPicker/SPColorPickerConfiguration`` from the `symbolPickerStyle` environment value.
3. **Availability**: The `spAllowsColorSelection` property.

### Usage

`SPColorPicker` fits into the ``SymbolPicker/SymbolPicker`` layout. After initialization, it finds the selected color, palette, and layout in the environment.
