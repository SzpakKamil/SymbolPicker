# ``SwiftUICore/View/symbolPicker(isPresented:emoji:configuration:)-(_,Binding<SPEmoji?>,_)``

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

Presents a symbol picker for selecting an emoji. This version binds to an optional emoji object.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedEmoji: SPEmoji? = SPEmoji("😀")

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

This modifier lets you include an emoji picker in your view hierarchy. It uses an optional binding, so the user can clear the current selection, setting the bound value to `nil`.
