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

The system name for the filled version of the SF Symbol.

## Overview

The `filledName` property stores the exact string required by `Image(systemName:)` to render the solid or filled variant of the symbol. This name is typically used when the symbol's variant is set to `.filled`.

### Naming Conventions

By convention in SF Symbols, filled variants usually include a `.fill` suffix (e.g., `"star.fill"`, `"heart.bubble.fill"`). This property allows the `SPSymbol` instance to switch between its two primary visual states without recalculating the system name dynamically.

### Selection Logic

When the picker needs to determine if a symbol is selected, it often compares a target system name against both `filledName` and `notFilled` to ensure a match regardless of the active variant.
