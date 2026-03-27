# ``SwiftUICore/View/symbolPicker(isPresented:emoji:ckColor:configuration:)-(_,Binding<SPEmoji?>,_,_)``

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

Presents a symbol picker for selecting an emoji and a color. This version binds to an optional emoji and a `CKColor` instance.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedEmoji: SPEmoji? = SPEmoji("😀")
    @State private var selectedColor = CKColor(hexString: "#FF0000")

    var body: some View {
        Button("Pick Emoji") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            emoji: $selectedEmoji,
            ckColor: $selectedColor
        )
    }
}
```

### Details

This initializer works with `CKColor` for precise color control across platforms. The emoji binding supports `nil` values, allowing users to clear their selection.
