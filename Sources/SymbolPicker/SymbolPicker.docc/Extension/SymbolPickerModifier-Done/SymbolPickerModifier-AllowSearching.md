# ``SymbolPicker/SymbolPickerModifier/spAllowSearching(_:)``

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

Toggle the search bar visibility in the presented picker.

## Overview

Show or hide the search bar. If you disable searching, users must browse the symbol grid without keyword filtering.

### Example

Hide the search bar:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spAllowSearching(false)
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `condition` | `Bool` | Toggle for search bar visibility. |
