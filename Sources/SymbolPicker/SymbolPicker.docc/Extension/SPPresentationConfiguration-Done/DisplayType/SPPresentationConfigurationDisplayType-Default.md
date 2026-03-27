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

You use the standard presentation style for each device.

## Overview

The `.default` setting adjusts the picker to fit the current device. It follows platform conventions so your users feel at home.

- **iPhone**: You see a bottom sheet that users can swipe to dismiss.
- **iPad**: You get a sheet or a centered modal, depending on whether you are using split-screen.
- **macOS**: The picker appears as a popover anchored to your triggering element.

### Use Case
Choose this for most apps. It lets the system enforce familiar behaviors and ensures accessibility features work correctly.
