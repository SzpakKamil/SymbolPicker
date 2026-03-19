# ``SymbolPicker/SPSymbol/init(filledName:notFilled:version:variant:annotation:category:subcategory:tags:)``

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

The "Full" initializer used for ingesting catalog data with all metadata.

- Parameters:
  - filledName: The system name for the filled variant of the symbol.
  - notFilled: The system name for the outlined (not filled) variant of the symbol.
  - version: The SF Symbols version this symbol was introduced in. Defaults to `1.0`.
  - variant: The preferred initial variant for the symbol. Defaults to `nil`.
  - annotation: A localized descriptive name for the symbol. Defaults to `nil`.
  - category: The primary category for the symbol. Defaults to `nil`.
  - subcategory: A more specific subcategory for the symbol. Defaults to `nil`.
  - tags: An array of search keywords. Defaults to `nil`.

## Overview

This is the primary initializer used when loading symbol data from JSON resources. It allows for the full specification of all `SPSymbol` properties, enabling rich search and organizational features.

### Composite ID Generation

Unlike the quick initializer, this initializer automatically generates a composite `id` using the following pattern:
`filledName + notFilled + category`

This ensures that the symbol remains unique even if other symbols share the same name but exist in different categories or have different variant mappings.
