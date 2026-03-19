# ``SymbolPicker/SPSymbol``

A data model for SF Symbols, supporting filled and outlined variants, localization, and system availability checks.

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

## Overview

`SPSymbol` is the primary data structure for managing Apple's SF Symbols within the `SymbolPicker`. It abstracts the complexity of symbol names, which often differ between their "filled" and "outlined" variants (e.g., `heart.fill` vs `heart`). It also ensures that only symbols available on the user's current operating system are displayed.

### Core Features

- **Variant Handling**: Stores both `filledName` and `notFilled` system names, allowing the UI to toggle between styles dynamically.
- **Availability**: Checks if the specific symbol (and its variants) can be instantiated on the running OS version.
- **Categorization**: Groups symbols into categories (e.g., "Weather", "Objects") to simplify browsing.
- **Search Optimization**: Includes `tags` and `annotation` fields to improve search relevance beyond just the system name.

### Conformance

`SPSymbol` is designed for use in robust data-driven UIs:
- **Identifiable**: Uses a composite ID to ensure uniqueness even if names overlap.
- **Codable**: Efficiently serializes to and from JSON asset catalogs.
- **SPDataAsset**: Interoperates with other asset types like Emojis in the picker.

## Topics

### Properties

- ``SymbolPicker/SPSymbol/id``
- ``SymbolPicker/SPSymbol/filledName``
- ``SymbolPicker/SPSymbol/notFilled``
- ``SymbolPicker/SPSymbol/annotation``
- ``SymbolPicker/SPSymbol/version``
- ``SymbolPicker/SPSymbol/variant``
- ``SymbolPicker/SPSymbol/category``
- ``SymbolPicker/SPSymbol/subcategory``
- ``SymbolPicker/SPSymbol/tags``

### Nested Types

- ``SymbolPicker/SPSymbol/Variant``

### Initialization

- ``SymbolPicker/SPSymbol/init(systemName:)``
- ``SymbolPicker/SPSymbol/init(filledName:notFilled:version:variant:annotation:category:subcategory:tags:)``

### Core Functionality

- ``SymbolPicker/SPSymbol/isAvailable()``
- ``SymbolPicker/SPSymbol/name(for:)``
- ``SymbolPicker/SPSymbol/asView()``
- ``SymbolPicker/SPSymbol/fetchAssets(locale:)``

### Static Helpers

- ``SymbolPicker/SPSymbol/filePrefix``
