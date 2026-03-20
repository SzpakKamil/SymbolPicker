# ``SymbolPicker/SPEmoji/fetchAssets(locale:)``

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

Loads and filters the emoji library for the specified locale.

## Overview

The `fetchAssets(locale:)` method is the primary pipeline for building the emoji library used by the `SymbolPicker`. It is an asynchronous, error-prone method that orchestrates data loading, decoding, and compatibility filtering.

### Loading Pipeline

1. **Resource Resolution**: Attempts to find a JSON file in the bundle matching the naming convention `emojis_[locale].json`. If the requested locale is missing, it falls back to English (`"en"`).
2. **Decoding**: Reads the file's data and decodes it into an array of `SPEmoji` objects.
3. **Availability Filtering**: After decoding, the method iterates through the entire array and executes ``SymbolPicker/SPEmoji/isAvailable()`` on each instance. Only emojis that are compatible with the current device are included in the final result.

### Usage

This method is typically called by the ``SymbolPicker/SPDataManager`` when initializing or switching the picker's language.
