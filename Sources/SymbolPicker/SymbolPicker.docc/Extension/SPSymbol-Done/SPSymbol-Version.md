# ``SymbolPicker/SPSymbol/version``

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

The required SF Symbols library version.

## Overview

The `version` property indicates the minimum SF Symbols release that includes the asset, such as 1.0 or 5.0.

### Tracking

Apple adds new SF Symbols with OS updates. This property works with ``SymbolPicker/SPSymbol/isAvailable()`` to determine if the current device can render the icon. By including the version in the model, SymbolPicker provides a reliable experience on older systems that lack the newest assets.
