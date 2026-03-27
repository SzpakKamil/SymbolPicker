# ``SymbolPicker/SymbolPickerModifier/spPresentationDents(_:)``

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

Configure allowed sheet detents for the presented picker.

## Overview

Set the supported sizes for the sheet containing the symbol picker. This modifier controls the heights the sheet can occupy during presentation.

### Example

Enable medium and large detents for the picker:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spPresentationDents([.medium, .large])
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `dents` | `Set<SPPresentationConfiguration.PresentationDents>` | The set of allowed sheet detents. |
