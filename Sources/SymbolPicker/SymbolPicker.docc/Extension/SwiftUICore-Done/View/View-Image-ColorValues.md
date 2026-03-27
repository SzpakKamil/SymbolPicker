# ``SwiftUICore/View/symbolPicker(isPresented:image:colorValues:configuration:)-(_,Binding<SPImage>,_,_)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(iPadOS, introduced: "16.0")
    @Available(macOS, introduced: "14.0")
    @Available(visionOS, introduced: "26.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticArticleSubheading(disabled)
}

## Overview

Presents a symbol picker for selecting a custom image and a color. This version binds to a required image and an array of RGBA doubles (`[Double]`).

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedImage = SPImage(systemName: "photo")
    @State private var selectedColorValues: [Double] = [1.0, 0.0, 0.0, 1.0]

    var body: some View {
        Button("Pick Image") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            image: $selectedImage,
            colorValues: $selectedColorValues
        )
    }
}
```

### Details

This initializer requires a valid `SPImage` at all times. It updates the `colorValues` array as the user selects new tints from the palette. Use this version for data models that require asset persistence without optional states.
