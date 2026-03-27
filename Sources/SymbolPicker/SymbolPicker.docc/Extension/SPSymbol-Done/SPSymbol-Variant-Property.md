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

The active visual style for the symbol.

## Overview

The `variant` property controls the rendering style. You use it to switch between filled and outlined versions of an SF Symbol.

### Behavior

If you set `variant` to `nil`, the library defaults to the `.outlined` state. You can also set this property globally through a `SymbolPickerConfiguration` to keep the entire interface consistent.

### Usage

When the symbol renders via `asView()`, this property determines which system name—`filledName` or `notFilled`—the system uses to initialize the image. Changes to this property in a SwiftUI context cause the view to re-render, giving users an interactive way to see different styles.
