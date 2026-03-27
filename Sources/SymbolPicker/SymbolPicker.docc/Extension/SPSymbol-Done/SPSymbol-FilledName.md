# ``SymbolPicker/SPSymbol/filledName``

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

The system name for the filled version of the symbol.

## Overview

The `filledName` property stores the string required to render the solid variant of a symbol. The system uses this name when the symbol's variant is set to `.filled`.

### Naming

By convention, these names usually include a `.fill` suffix, such as `"star.fill"` or `"heart.bubble.fill"`. This property allows `SPSymbol` to switch between visual states without recalculating names at runtime.

### Highlighting

When the picker checks for selection, it compares target names against both `filledName` and `notFilled`. This ensures the correct icon highlights regardless of which variant is active.
