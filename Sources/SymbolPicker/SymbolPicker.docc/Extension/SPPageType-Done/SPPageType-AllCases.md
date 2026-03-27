# ``SymbolPicker/SPPageType/allCases``

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

The list of available page types.

## Overview

The `allCases` property returns all `SPPageType` cases supported by the current device and OS.

### Logic

The property filters out unsupported cases using availability checks. For example, it excludes `.image` on older OS versions. This ensures the picker navigation only shows pages the system can render correctly.
