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

The system name for the outlined or standard version of the SF Symbol.

## Overview

The `notFilled` property stores the base system name for the SF Symbol, which typically corresponds to its outlined (stroked) appearance. This name is used when the symbol's variant is set to `.outlined`.

### Naming Conventions

Unlike the filled variant, the `notFilled` string usually represents the "root" name of the symbol without any fill-related suffixes (e.g., `"star"`, `"heart.bubble"`). 

### Use Cases

This property is the default representation for symbols in many UI contexts, especially where a lighter, more minimalist visual style is preferred. It is also used by the library to perform a baseline availability check on the current operating system.
