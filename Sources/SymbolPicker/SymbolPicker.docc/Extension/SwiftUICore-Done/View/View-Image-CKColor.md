# ``SwiftUICore/View/symbolPicker(isPresented:image:ckColor:configuration:)-(_,Binding<SPImage>,_,_)``

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

Presents a symbol picker for selecting a custom image and a color. This version uses `CKColor` for precise, platform-agnostic color management.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedImage = SPImage(systemName: "photo")
    @State private var selectedColor = CKColor(hexString: "#FF0000")

    var body: some View {
        Button("Pick Image") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            image: $selectedImage,
            ckColor: $selectedColor
        )
    }
}
```

### Details

This initializer requires a non-optional `SPImage`. Use it when your data model must always have a valid image selection. The picker updates the `ckColor` binding as users pick new tints from the palette.
