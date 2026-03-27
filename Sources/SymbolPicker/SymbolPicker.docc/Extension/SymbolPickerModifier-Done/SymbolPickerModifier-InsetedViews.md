# ``SymbolPicker/SymbolPickerModifier/spInsetedViews(replaceDefaults:views:)``

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

Inject custom SwiftUI views into predefined slots in the picker.

## Overview

Add auxiliary views like buttons, labels, or custom selection previews to the picker interface. You can place these views in the safe area or toolbar slots.

### Example

Add a custom title to the picker bar:

```swift
Text("Select Icon")
    .symbolPicker(isPresented: $isPresented, systemImage: $symbolName)
    .spInsetedViews {
        SPInsetedView(placement: .topBarLeading) {
            Text("Custom Picker")
                .font(.headline)
        }
    }
```

### Parameters

| Name | Type | Description |
| :--- | :--- | :--- |
| `replaceDefaults` | `Bool` | Toggle to remove existing default views in the slot. |
| `views` | `() -> [SPInsetedView]` | A closure that returns custom views. |
