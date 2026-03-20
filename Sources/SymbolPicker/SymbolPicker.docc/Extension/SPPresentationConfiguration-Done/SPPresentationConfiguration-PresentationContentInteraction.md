# ``SymbolPicker/SPPresentationConfiguration/presentationContentInteraction``

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

Determines how the presentation content behaves during user interaction.

## Overview

The `presentationContentInteraction` property controls whether the content inside a sheet scrolls or resizes the sheet when dragged. It uses the ``SymbolPicker/SPPresentationConfiguration/ContentInteraction`` enum.

### Default Value

The default value is `.automatic`.
