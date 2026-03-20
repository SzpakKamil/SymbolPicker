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

Determines how the user can interact with the view behind a presentation.

## Overview

The `presentationBackgroundInteraction` property allows you to specify whether touches outside the presented view should be blocked or passed through to the underlying content. It uses the ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction`` enum.

### Default Value

The default value is `.disabled` (standard modal behavior).
