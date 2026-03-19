# ``SymbolPicker/SPSymbol/variant``

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

The currently active visual style for this symbol instance.

## Overview

The `variant` property allows for the dynamic selection of the symbol's rendering style. By changing this property, you can switch between a filled and an outlined appearance for the SF Symbol.

### Behavior and Defaults

If `variant` is set to `nil`, the library typically defaults to the `.outlined` state. However, it is often set globally via a `SymbolPickerConfiguration` to maintain consistency throughout the entire picker interface.

### UI Integration

When a symbol is rendered (e.g., via the `asView()` method), this property determines which system name—`filledName` or `notFilled`—is actually used for the system image initialization.

### Reactivity

In a SwiftUI context, changes to the variant property on an observable symbol instance will cause the corresponding views to re-render, providing an interactive way to preview different styles.
