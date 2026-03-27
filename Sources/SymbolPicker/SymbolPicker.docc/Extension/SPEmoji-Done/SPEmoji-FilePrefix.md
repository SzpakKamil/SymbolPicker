# ``SymbolPicker/SPEmoji/filePrefix``

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

The identifier for emoji data files.

## Overview

The `filePrefix` static property tells ``SymbolPicker/SPDataManager`` to look for JSON files starting with `"emojis"`.

### File Naming

The data manager joins this prefix with your app's locale to find the right catalog. For example, it searches for `emojis_en.json` or `emojis_pl.json`. This organization keeps emoji data separate from other assets like symbols.
