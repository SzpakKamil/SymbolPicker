# ``SymbolPicker/SPSymbol/category``

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

The primary group for the symbol.

## Overview

The `category` property sets the broad classification for a symbol, such as "Weather," "Objects," or "Devices." SymbolPicker uses this metadata to organize icons into sections, making it easier for users to browse the library.

### Organization

In the UI, categories often appear as sections or tabs. While Apple provides categories for SF Symbols, this property allows the package to maintain that structure or define custom groups.

### Defaults

This property is optional. If a symbol lacks a category, the system places it in a "General" or "Miscellaneous" group during rendering.
