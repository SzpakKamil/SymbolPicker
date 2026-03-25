# ``SymbolPicker/SPSupportedPlatforms/macOS(_:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(macOS, introduced: "12.0")
    @DocumentationExtension(mergeBehavior: override)
}

The macOS platform with an optional version number.

## Overview

The `macOS` case represents the Apple desktop platform. It can store an optional integer representing the major OS version (e.g., 12, 13, 14), which allows the library to perform version-specific feature detection.
