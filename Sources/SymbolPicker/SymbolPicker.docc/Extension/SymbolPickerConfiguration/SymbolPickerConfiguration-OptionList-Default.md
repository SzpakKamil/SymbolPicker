# ``SymbolPicker/SymbolPickerConfiguration/optionList-1q9z3``

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

A convenience computed property that returns the main asset list configuration.

## Default Implementation

The default implementation returns the result of the ``SymbolPicker/SymbolPickerConfiguration/optionListConfiguration()`` method.

```swift
var optionList: SPOptionListConfiguration { optionListConfiguration() }
```
