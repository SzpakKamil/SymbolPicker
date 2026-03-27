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

The platform determines the interaction behavior based on the presentation type and context when you set this to `.automatic`. The system usually disables background interaction for standard modal sheets to focus the user on their selection. On larger screens or within popovers, the system might allow background interaction if it matches standard interface guidelines.

### Platform Conventions
Use this mode to follow standard platform rules. You let the operating system handle the interaction logic instead of enforcing a specific model. This ensures your app feels consistent with other system applications. If Apple updates the default behavior in a future OS version, your app adopts the new standard automatically.

### Adaptive Behavior
The system adapts the interaction based on the device. On an iPhone, the picker covers enough space that blocking background touches makes sense. On an iPad, the same picker might appear as a popover that naturally allows the user to see and touch the background. You avoid writing custom logic for each screen size by trusting the system's default.
