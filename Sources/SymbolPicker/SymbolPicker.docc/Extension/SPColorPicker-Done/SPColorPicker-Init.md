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

Initializes a new color picker instance.

## Overview

The `init()` initializer creates an `SPColorPicker` that is fully driven by the host's environment. 

### Component Requirements

For the initialized picker to render, several environmental factors must be in place:
1. **Selection Context**: Must be within an environment that provides access to the shared ``SymbolPicker/SPSelection``.
2. **Configuration Access**: Requires an ``SwiftUICore/EnvironmentValues/symbolPickerStyle`` to provide an ``SymbolPicker/SPColorPickerConfiguration``.
3. **Availability State**: The ``SwiftUICore/EnvironmentValues/spAllowsColorSelection`` property must be set to `true`.

### Usage within the SymbolPicker

While `SPColorPicker` can be used as a standalone component, it is designed to be an integral part of the ``SymbolPicker/SymbolPicker`` layout. Once initialized, it automatically resolves its internal state (selected color, available palette, and layout mode) from its environmental context.
