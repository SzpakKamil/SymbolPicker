# ``SwiftUICore/View/symbolPicker(isPresented:selection:configuration:)-(_,Binding<SPSelection<DataAsset>?>,_)``

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

Presents a symbol picker for selecting symbols, emojis, or images. This version binds to an optional generic selection object.

### Example Usage

```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selection: SPSelection<SPSymbol>? = SPSelection(systemName: "star.fill")

    var body: some View {
        Button("Pick Item") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            selection: $selection
        )
    }
}
```

### Details

This overload is highly flexible. It supports any asset type that follows the `SPDataAsset` protocol. The binding can be `nil`, letting users deselect items in the picker.
