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
Presents a symbol picker that allows the user to select an emoji and a color, which are synchronized with the provided bindings. This overload synchronizes with an array of color values (`[Double]`).

## Example Usage
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
