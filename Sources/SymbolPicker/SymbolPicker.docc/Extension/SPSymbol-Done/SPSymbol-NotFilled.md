# ``SymbolPicker/SPSymbol/notFilled``

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

The system name for the outlined version of the symbol.

## Overview

The `notFilled` property stores the base SF Symbol name. The system uses this name when the symbol's variant is set to `.outlined`.

### Naming

This string represents the "root" name without fill-related suffixes, such as `"star"` or `"heart.bubble"`.

### Usage

This property provides the default look for symbols in many interfaces. The library also uses it to perform baseline availability checks on the current OS.
