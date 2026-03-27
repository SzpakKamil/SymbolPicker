# ``SwiftUICore/View/symbolPicker(isPresented:image:configuration:)-(_,Binding<SPImage?>,_)``

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

Presents a symbol picker for selecting a custom image. This version binds to an optional image asset.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedImage: SPImage? = SPImage(systemName: "photo")

    var body: some View {
        Button("Pick Image") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            image: $selectedImage
        )
    }
}
```

### Details

The optional binding lets users clear their image selection. The picker updates the state whenever users choose a photo from the grid or clear the current choice.
