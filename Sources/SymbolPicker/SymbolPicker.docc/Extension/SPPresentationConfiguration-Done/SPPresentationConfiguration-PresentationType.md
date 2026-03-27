# ``SymbolPicker/SPPresentationConfiguration/presentationType``

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

You choose how the SymbolPicker appears on screen.

## Overview

Set `presentationType` to define the container style. You can select standard modal types like sheets or popovers. This property ensures your picker matches the rest of your app's navigation flow. 

When you pick a specific type, you override the system's adaptive behavior. This gives you consistent layouts across iPad and Mac, where the system might otherwise choose different styles.

### Values

- **default**: You let the platform choose the best style, usually a sheet on iPhone and a popover on iPad or Mac.
- **popover**: You force the picker into a floating panel anchored to your source view.
- **sheet**: You present the picker as a modal sheet that slides up from the bottom.

### Usage in Code

```swift
let config = SPPresentationConfiguration()
    .spPresentationType(.popover)
```
