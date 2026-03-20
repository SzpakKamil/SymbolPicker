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

The prefix used to identify the emoji data files.

## Overview

The `filePrefix` static property instructs the ``SymbolPicker/SPDataManager`` to search for localizable JSON resources with filenames starting with `"emojis"`.

### Naming Convention

The data manager combines this prefix with the user's locale to resolve the correct catalog (e.g., `emojis_pl.json` for Polish users).
