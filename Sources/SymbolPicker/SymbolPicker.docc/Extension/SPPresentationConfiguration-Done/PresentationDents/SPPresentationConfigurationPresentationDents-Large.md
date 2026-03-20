# ``SymbolPicker/SPPresentationConfiguration/PresentationDents/large``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(iPadOS, introduced: "16.0")
    @Available(macOS, introduced: "13.0")
    @Available(tvOS, introduced: "16.0")
    @Available(watchOS, introduced: "9.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.7")
    @Available(Xcode, introduced: "14.0")
    @DocumentationExtension(mergeBehavior: override)
}

A large presentation detent.

## Overview

When set to `.large`, the sheet expands to fill most of the available screen height, typically leaving only the status bar or a small portion of the parent view visible. This is the standard "full-height" sheet on iOS.

### Use Case
This is best for browsing large collections of symbols where maximum vertical space is beneficial for scanning the grid. It often serves as the "expanded" state when paired with `.medium`.
