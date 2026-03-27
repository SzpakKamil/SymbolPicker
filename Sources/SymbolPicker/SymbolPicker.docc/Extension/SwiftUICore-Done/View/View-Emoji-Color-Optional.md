# ``SwiftUICore/View/symbolPicker(isPresented:emoji:color:configuration:)-(_,Binding<SPEmoji?>,_,_)``

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

Presents a symbol picker for selecting an emoji and a color. This version binds to an optional emoji and a SwiftUI `Color`.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedEmoji: SPEmoji? = SPEmoji("😀")
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

The `emoji` binding supports `nil` values, letting users clear their choice. The picker updates the `selectedColor` object as users interact with the color palette. This overload works best for apps using standard SwiftUI state types.
