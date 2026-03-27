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

Creates a symbol with all metadata.

- Parameters:
  - filledName: The name for the filled variant.
  - notFilled: The name for the outlined variant.
  - version: The SF Symbols version. Defaults to `1.0`.
  - variant: The initial variant. Defaults to `nil`.
  - annotation: A localized descriptive name. Defaults to `nil`.
  - category: The primary category. Defaults to `nil`.
  - subcategory: A specific subcategory. Defaults to `nil`.
  - tags: An array of search keywords. Defaults to `nil`.

## Overview

This is the main initializer for loading symbol data from JSON resources. It sets every `SPSymbol` property to enable deep search and categorization.

### Identifier

Unlike the quick initializer, this method builds a composite `id`:
`filledName + notFilled + category`

This makes the symbol unique even if other icons share the same name in different categories.
