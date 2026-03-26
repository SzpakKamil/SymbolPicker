# ``SymbolPicker/SymbolPickerDefaultConfiguration/defaultType``

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

The asset category that is initially displayed when the picker appears.

## Overview

The `defaultType` property determines the active page (category) when the picker is first presented. By default, it is set to ``SymbolPicker/SPPageType/symbol``, showcasing SF Symbols initially.

### Selection Logic

If your picker is bound to a specific asset type (like ``SymbolPicker/SPEmoji``), the picker will automatically switch to the relevant category upon appearance, regardless of this default. However, for generic pickers, this property controls the starting category.

### Customization

Change the default page to focus on a different asset type first.

```swift
var config = SymbolPickerDefaultConfiguration()
config.defaultType = .emoji // Start with Emojis
```
