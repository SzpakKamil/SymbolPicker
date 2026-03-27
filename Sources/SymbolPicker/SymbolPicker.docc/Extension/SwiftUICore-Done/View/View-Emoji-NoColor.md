# ``SwiftUICore/View/symbolPicker(isPresented:emoji:configuration:)-(_,Binding<SPEmoji>,_)``

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
    @AutomaticArticleSubheading(disabled)
}

## Overview

Presents a symbol picker for selecting an emoji. This version binds to a required emoji object.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedEmoji = SPEmoji("😀")

    var body: some View {
        Button("Pick Emoji") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            emoji: $selectedEmoji
        )
    }
}
```

### Details

Use this method when your view requires a valid emoji selection. The picker updates the binding whenever the user chooses a new character from the library.
