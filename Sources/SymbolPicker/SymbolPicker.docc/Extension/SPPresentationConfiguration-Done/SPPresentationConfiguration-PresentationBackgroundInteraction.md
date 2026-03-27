# ``SymbolPicker/SPPresentationConfiguration/presentationBackgroundInteraction``

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

You decide if the user can touch the app behind the picker.

## Overview

The `presentationBackgroundInteraction` property sets whether the picker blocks touches to the background. You use the ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction`` enum to configure this.

Enabling background interaction lets users see the results of their symbol choice instantly. For example, they can tap a "Preview" button in the background while the picker stays open.

### Default Value

The default value is `.disabled`, which blocks all background interaction until you close the picker.
