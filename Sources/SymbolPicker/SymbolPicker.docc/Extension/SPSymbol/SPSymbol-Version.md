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

The SF Symbols library version required for the asset.

## Overview

The `version` property indicates the minimum version of Apple's SF Symbols library that includes this specific symbol (e.g., 1.0, 3.0, 5.0).

### Version Tracking

As Apple introduces new SF Symbols with each major OS release, it is important to track which version a symbol belongs to. This information is used in conjunction with ``SymbolPicker/SPSymbol/isAvailable()`` to determine if a symbol can be rendered on the current device.

### Data Integrity

Including the version in the `SPSymbol` model ensures that the package can handle symbols from different eras of SF Symbols correctly, providing a reliable experience even when running on older operating systems that might lack the latest assets.
