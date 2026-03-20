# ``SymbolPicker/SPInsetedView/spIsDisplayed(when:)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

Sets a conditional visibility condition for the inseted view and returns a modified instance.

- Parameter action: A closure that takes current `EnvironmentValues` and returns a Boolean indicating whether the view should be displayed.
- Returns: A new `SPInsetedView` instance with the specified visibility condition.

## Overview

`spIsDisplayed(when:)` provides a mechanism for showing or hiding the inset view based on the state of the picker. This is highly reactive to environmental changes within the `SymbolPicker`.

### Dynamic Visibility

You can use this method to only show specific information when a search is active, when a color has been selected, or for certain asset types.

### Usage in Code

```swift
let dynamicHeader = SPInsetedView(placement: .safeAreaTop) {
    Text("Search Active")
}
.spIsDisplayed { environment in
    !environment.spSearchText.isEmpty
}
```
