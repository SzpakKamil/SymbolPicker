# ``SymbolPicker/SPSearchBar``

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

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

A localized search interface for filtering the available symbols and emojis.

## Overview

`SPSearchBar` provides the primary search functionality within the `SymbolPicker`, enabling users to find assets by name, category, or tag.

### Context-Aware Prompt and Behavior

The search bar is fully integrated with the picker's current state:
- **Dynamic Prompts**: Automatically updates its placeholder text based on the active page (e.g., "Search Symbols" vs. "Search Emojis").
- **Automatic Filtering**: Hides itself if searching is disabled in the ``SymbolPicker/SymbolPickerConfiguration/allowSearching`` or if no searchable page types (Symbols or Emojis) are allowed.
- **Persistent State**: Binds to the `spSearchText` environment property, ensuring that search queries are maintained across UI updates.

### Adaptive Platform Aesthetics

The view leverages the `SearchBar` package with platform-specific modifiers to ensure a native look and feel:
- **iOS/visionOS**: Features capsule-shaped or rounded rectangular backgrounds with blurred materials. On supported OS versions (iOS 26+), it utilizes native glass effects for modern translucency.
- **macOS/tvOS**: Uses specialized focus behaviors and rounded rectangular backgrounds to align with system-native search patterns.

## Topics

### Initialization

- ``SymbolPicker/SPSearchBar/init()``
