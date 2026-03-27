# ``SwiftUICore/View/symbolPicker(isPresented:systemImage:colorValues:configuration:)-(_,Binding<String?>,_,_)``

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

Presents a symbol picker for selecting a Symbol and a color. This version binds the symbol name to an optional string and the tint to an array of RGBA doubles (`[Double]`).

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selectedSymbol: String? = "star.fill"
    @State private var selectedColorValues: [Double] = [1.0, 0.0, 0.0, 1.0]

    var body: some View {
        Button("Pick Symbol") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            systemImage: $selectedSymbol,
            colorValues: $selectedColorValues
        )
    }
}
```

### Parameters

- **isPresented**: A binding to a boolean that controls the picker's visibility.
systemImage: An optional binding for the SF Symbol name.
- **colorValues**: A binding to an RGBA array for the tint color.
- **configuration**: Settings for the picker's layout and style.


