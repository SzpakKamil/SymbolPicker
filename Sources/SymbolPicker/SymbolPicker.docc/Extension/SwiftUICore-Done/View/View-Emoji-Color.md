# ``SwiftUICore/View/symbolPicker(isPresented:emoji:color:configuration:)-(_,Binding<SPEmoji>,_,_)``

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

Presents a symbol picker for selecting an emoji and a color. This version binds to a required emoji and a SwiftUI `Color`.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedEmoji = SPEmoji("😀")
    @State private var selectedColor = Color.red

    var body: some View {
        Button("Pick Emoji") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            emoji: $selectedEmoji,
            color: $selectedColor
        )
    }
}
```

### Details

This modifier requires a valid `SPEmoji` instance in your state. The picker updates the `selectedColor` object whenever the user chooses a new tint from the palette.
