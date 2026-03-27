# ``SwiftUICore/View/symbolPicker(isPresented:systemImage:configuration:)-(_,Binding<String>,_)``

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

Presents a symbol picker for selecting an SF Symbol. This version binds to a required symbol name string.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedSymbol = "star.fill"

    var body: some View {
        Button("Pick Symbol") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            systemImage: $selectedSymbol
        )
    }
}
```

### Details

This modifier synchronizes your state with the user's choice in the picker. It requires a non-optional binding, ensuring that a valid symbol name always exists in your data model.
