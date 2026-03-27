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

Sets a visibility condition for the inseted view.

- Parameter action: A closure that returns `true` if the view should appear.
- Returns: A modified `SPInsetedView` instance.

## Overview

Use `spIsDisplayed(when:)` to show or hide inset views based on the picker's state. The condition responds to changes in the environment.

### Dynamic Visibility

You can show information only when users search for items, pick a color, or browse specific asset types.

### Example

```swift
let dynamicHeader = SPInsetedView(placement: .safeAreaTop) {
    Text("Search Active")
}
.spIsDisplayed { env in
    !env.spSearchText.isEmpty
}
```
