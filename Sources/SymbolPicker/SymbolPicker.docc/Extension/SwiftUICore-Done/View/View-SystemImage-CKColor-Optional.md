# ``SwiftUICore/View/symbolPicker(isPresented:systemImage:ckColor:configuration:)-(_,Binding<String?>,_,_)``

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

Presents a symbol picker for selecting an SF Symbol and a color. This version binds to an optional symbol name and a `CKColor`.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedSymbol: String? = "star.fill"
    @State private var selectedColor = CKColor(hexString: "#FF0000")

    var body: some View {
        Button("Pick Symbol") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            systemImage: $selectedSymbol,
            ckColor: $selectedColor
        )
    }
}
```

### Details

The `systemImage` binding can be `nil`, letting users clear their choice. The system updates the `ckColor` binding whenever the user selects a new tint in the picker. This overload is ideal for apps using ColorKit for platform-agnostic color management.
