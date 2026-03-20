# ``SymbolPicker/SPPresentationConfiguration/DisplayType/sheet``

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

Presents the picker as a sheet.

## Overview

When set to `.sheet`, the `SymbolPicker` slides up from the bottom of the screen on iOS and iPadOS, or appears as a centered modal sheet on macOS.

### Characteristics
- **iOS/iPadOS**: Offers standard pull-to-dismiss behavior and can be resized (if ``SymbolPicker/SPPresentationConfiguration/presentationDents`` are configured).
- **macOS**: Appears as a modal sheet attached to the window, blocking interaction with the parent window until dismissed.

### Use Case
Ideal for primary tasks that require a significant portion of the screen or when the user must complete a selection flow.
