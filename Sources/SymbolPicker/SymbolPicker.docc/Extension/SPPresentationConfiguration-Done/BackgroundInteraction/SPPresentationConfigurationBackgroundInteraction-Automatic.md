# ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/automatic``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.4")
    @Available(iPadOS, introduced: "16.4")
    @Available(macOS, introduced: "13.3")
    @Available(tvOS, introduced: "16.4")
    @Available(watchOS, introduced: "9.4")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.7")
    @Available(Xcode, introduced: "14.3")
    @DocumentationExtension(mergeBehavior: override)
}

The system's default background interaction behavior.

## Overview

When set to `.automatic`, the platform determines the appropriate interaction behavior based on the presentation type and context. This typically defaults to disabling background interaction for standard modal sheets, ensuring a focused user experience. However, on larger screens or specific contexts like popovers, the system may allow interaction if it aligns with standard interface guidelines.

### Use Case
Use this mode when you want to adhere to the standard platform conventions without enforcing a specific interaction model.
