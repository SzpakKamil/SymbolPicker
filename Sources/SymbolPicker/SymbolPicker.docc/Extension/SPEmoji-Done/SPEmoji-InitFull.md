# ``SymbolPicker/SPEmoji/init(id:version:category:annotation:subcategory:tags:skins:tone:)``

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

The primary initializer for creating a fully-specified emoji instance.

## Overview

The `init(id:version:...)` initializer provides complete control over all aspects of the `SPEmoji` model. It is primarily used by the `Codable` implementation when decoding the internal emoji catalogs.

### Key Parameters

- **`id`**: The Unicode hexcode string.
- **`version`**: The Unicode standard release.
- **`category` & `subcategory`**: Organization properties for the picker interface.
- **`annotation` & `tags`**: Searchable and descriptive metadata.
- **`skins`**: A list of supported variations.
- **`tone`**: The initial variation state.
