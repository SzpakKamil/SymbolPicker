# ``SymbolPicker/SPDismissButton/init()``

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

You create a button that closes the SymbolPicker.

## Overview

The `init()` initializer creates an `SPDismissButton` that handles its own appearance and logic based on the environment.

### Dismissal Binding

The button automatically finds the `dismiss` action in the SwiftUI environment. It ensures the picker closes correctly whether you presented it as a sheet, popover, or full-screen cover.

### Automatic Style Resolution

The button chooses the best look for the current device and OS version:
- **Style**: It uses modern glass styles on new platforms and standard buttons on older ones.
- **Iconography**: It picks the right "Close" icon, like a circle-filled "X".
- **Labeling**: It applies localized text for both visual labels and accessibility descriptions.
