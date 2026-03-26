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

Injects custom SwiftUI views into predefined "safe area" or "toolbar" slots within the presented picker.

## Overview

Use this modifier to add auxiliary views like buttons, labels, or custom selection previews to the picker's interface.

### Example

Add a custom title to the top of the picker:

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
| `replaceDefaults` | `Bool` | If `true`, existing default views in the targeted placement are removed. |
| `views` | `() -> [SPInsetedView]` | A closure that returns the set of custom views to inject. |
