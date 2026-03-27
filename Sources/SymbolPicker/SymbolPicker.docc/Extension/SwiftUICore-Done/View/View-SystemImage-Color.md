# ``SwiftUICore/View/symbolPicker(isPresented:systemImage:color:configuration:)-(_,Binding<String>,_,_)``

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

Presents a symbol picker for selecting an SF Symbol and a color. This version binds to a required symbol name and a SwiftUI `Color`.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedSymbol = "star.fill"
    @State private var selectedColor = Color.red

    var body: some View {
        Button("Pick Symbol") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            systemImage: $selectedSymbol,
            color: $selectedColor
        )
    }
}
```

### Details

The picker updates the `selectedSymbol` string and the `selectedColor` object as the user interacts with the grid and palette. Use this version when your app relies on native SwiftUI types for state management.
