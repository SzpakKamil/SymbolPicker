# ``SwiftUICore/View/symbolPicker(isPresented:emoji:colorValues:configuration:)-(_,Binding<SPEmoji>,_,_)``

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

Presents a symbol picker for selecting an emoji and a color. This version binds to a required emoji and an array of RGBA doubles (`[Double]`).

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedEmoji = SPEmoji("😀")
    @State private var selectedColorValues: [Double] = [1.0, 0.0, 0.0, 1.0]

    var body: some View {
        Button("Pick Emoji") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            emoji: $selectedEmoji,
            colorValues: $selectedColorValues
        )
    }
}
```

### Details

This modifier requires a non-optional `SPEmoji` instance. It updates the color values in the array whenever the user chooses a new tint in the picker. Use this version when your data model stores color components as raw numbers.
