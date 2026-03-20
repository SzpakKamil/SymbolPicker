# ``SymbolPicker/SPPresentationConfiguration/DisplayType/default``

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

The platform-default presentation style.

## Overview

When set to `.default`, the `SymbolPicker` adapts its presentation style based on the running device and context:
- **iPhone**: Typically presents as a bottom sheet.
- **iPad**: May present as a sheet or a centered modal depending on split-screen status.
- **macOS**: Typically presents as a popover anchored to the triggering element.

### Use Case
This is the recommended setting for most applications, as it allows the system to enforce standard platform conventions.
