# ``SymbolPicker/SPPresentationConfiguration/PresentationDents/medium``

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

You snap the sheet to half-screen height.

## Overview

When you choose `.medium`, the sheet covers about half the screen. This creates a "drawer" effect that balances space for symbols with visibility for your app's background.

### Use Case
Use this for quick symbol changes. It works well when you want the user to see the results of their choice immediately. You can pair this with ``SymbolPicker/SPPresentationConfiguration/BackgroundInteraction/enabled`` so users can touch the background while the picker stays open at half-height.
