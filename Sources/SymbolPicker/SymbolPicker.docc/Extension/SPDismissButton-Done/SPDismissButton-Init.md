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

Initializes a new dismiss button instance.

## Overview

The `init()` initializer creates an `SPDismissButton` that resolves its appearance and behavior from the environment.

### Dismissal Binding

Upon initialization, the button binds to the `dismiss` action provided by the SwiftUI environment. This ensures that the button correctly closes the current presentation context, regardless of how the `SymbolPicker` is presented (e.g., as a sheet, popover, or full-screen cover).

### Automatic Style Resolution

The button automatically determines the most appropriate visual representation based on the host platform and OS version. This includes:
- **Style**: Using `.glass` on modern platforms or standard system buttons on legacy ones.
- **Iconography**: Selecting the appropriate "Close" icon (e.g., `xmark` vs `xmark.circle.fill`).
- **Labeling**: Applying localized strings for both the visual label and accessibility descriptions.
